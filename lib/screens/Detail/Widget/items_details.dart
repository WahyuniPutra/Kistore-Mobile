import 'package:ecommerce_mobile_app/models/product_model.dart';
import 'package:flutter/material.dart';

// Kelas ItemsDetails adalah widget StatelessWidget yang digunakan untuk menampilkan detail produk.
class ItemsDetails extends StatelessWidget {
  // Properti product bertipe Product digunakan untuk menyimpan data produk yang akan ditampilkan.
  final Product product;
  // Konstruktor ItemsDetails digunakan untuk menginisialisasi objek ItemsDetails dengan memberikan nilai pada properti product.
  const ItemsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Menampilkan judul produk menggunakan widget Text.
        Text(
          product.title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        // Menampilkan harga produk menggunakan widget Text.
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}", // Menampilkan harga produk dalam format mata uang.
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10), // Memberikan jarak vertikal.
              ],
            ),
            const Spacer(), // Spacer digunakan untuk memberikan ruang kosong di antara elemen-elemen dalam Row.
          ],
        )
      ],
    );
  }
}
