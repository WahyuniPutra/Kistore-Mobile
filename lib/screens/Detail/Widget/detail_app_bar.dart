import 'package:ecommerce_mobile_app/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../Provider/favorite_provider.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.pop(
                  context); // Kembali ke halaman sebelumnya ketika tombol diklik
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const Spacer(),
          const SizedBox(width: 10),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              provider.toggleFavorite(
                  product); // Tukar status favorit ketika tombol diklik
            },
            icon: Icon(
              provider.isExist(product)
                  ? Icons
                      .favorite // Jika produk sudah difavoritkan, tampilkan ikon hati terisi
                  : Icons
                      .favorite_border, // Jika belum, tampilkan ikon hati kosong
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
