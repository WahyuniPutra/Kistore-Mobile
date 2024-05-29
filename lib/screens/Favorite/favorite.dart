import 'package:ecommerce_mobile_app/Provider/favorite_provider.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key}); // Ini adalah konstruktor untuk widget Favorite

  @override
  State<Favorite> createState() =>
      _FavoriteState(); // Ini adalah method untuk membuat state dari widget Favorite
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(
        context); // Mendapatkan instance dari FavoriteProvider menggunakan metode static 'of'
    final finalList =
        provider.favorites; // Mendapatkan daftar item favorit dari provider
    return Scaffold(
      backgroundColor:
          kcontentColor, // Mengatur warna latar belakang scaffold sesuai dengan konstanta yang telah ditentukan
      appBar: AppBar(
        backgroundColor:
            kcontentColor, // Mengatur warna latar belakang app bar sesuai dengan konstanta yang telah ditentukan
        title: const Text(
          "Favorite",
          style: TextStyle(
              fontWeight: FontWeight.bold), // Mengatur gaya teks judul app bar
        ),
        centerTitle: true, // Mengatur posisi judul app bar menjadi di tengah
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length, // Jumlah item dalam daftar favorit
              itemBuilder: (context, index) {
                final favoritItems = finalList[
                    index]; // Mendapatkan item favorit berdasarkan indeks
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: kcontentColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Image.network(
                                favoritItems
                                    .image, // Menampilkan gambar dari URL favorit item
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    favoritItems
                                        .title, // Menampilkan judul favorit item
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const SizedBox(height: 8),
                                Text(
                                  "\$${favoritItems.price}", // Menampilkan harga favorit item
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              finalList.removeAt(
                                  index); // Menghapus item favorit saat tombol hapus ditekan
                              setState(
                                // Memperbarui tampilan setelah item dihapus
                                () {},
                              );
                            },
                            child: const Icon(Icons.delete,
                                color: Colors.red, size: 25),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
