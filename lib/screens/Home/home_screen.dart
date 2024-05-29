import 'package:ecommerce_mobile_app/models/product_model.dart';
import 'package:ecommerce_mobile_app/screens/Home/Widget/product_cart.dart';
import 'package:ecommerce_mobile_app/screens/Home/Widget/search_bar.dart';
import 'package:flutter/material.dart';

import 'Widget/image_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  late Future<List<Product>> futureProducts;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    futureProducts =
        fetchProducts(); // Menginisialisasi futureProducts dengan fetchProducts() untuk mendapatkan produk yang akan datang.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              MySearchBAR(onSearch: (String query) {
                setState(() {
                  searchQuery =
                      query; // Mengatur searchQuery dengan query yang diterima dari fungsi callback onSearch di MySearchBAR.
                });
              }),
              const SizedBox(height: 20),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(
                    () {
                      currentSlider =
                          value; // Mengatur currentSlider dengan nilai baru saat slide berubah.
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              if (selectedIndex == 0)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 10),
              Container(
                height: 310,
                child: FutureBuilder<List<Product>>(
                  future: futureProducts,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final filteredProducts = snapshot.data!
                          .where((product) => product.title
                              .toLowerCase()
                              .contains(searchQuery
                                  .toLowerCase())) // Menerapkan filter untuk produk berdasarkan judul yang cocok dengan query pencarian.
                          .toList();
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: filteredProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCard(
                              product: filteredProducts[
                                  index]); // Membangun item grid untuk setiap produk yang difilter.
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator(); // Tampilkan indikator kemajuan jika data belum tersedia.
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
