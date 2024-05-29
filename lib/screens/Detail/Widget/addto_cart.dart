import 'package:ecommerce_mobile_app/Provider/cart_provider.dart';
import 'package:ecommerce_mobile_app/constants.dart';
import 'package:ecommerce_mobile_app/models/product_model.dart';
import 'package:flutter/material.dart';

// Widget AddToCart digunakan untuk menampilkan tombol "Add to Cart" pada halaman produk.
class AddToCart extends StatefulWidget {
  final Product product;
  const AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(
        context); // Mengambil instance dari CartProvider menggunakan CartProvider.of(context).
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                provider.toggleFavorite(widget
                    .product); // Memanggil toggleFavorite pada provider ketika tombol "Add to Cart" ditekan.
                const snackBar = SnackBar(
                  content: Text(
                    "Successfully added!", // Pesan yang akan ditampilkan pada SnackBar.
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 1), // Durasi tampilan SnackBar.
                );
                ScaffoldMessenger.of(context)
                    .showSnackBar(snackBar); // Menampilkan SnackBar.
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  "Add to Cart", // Teks pada tombol "Add to Cart".
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
