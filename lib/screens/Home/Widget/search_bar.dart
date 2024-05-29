import 'package:ecommerce_mobile_app/constants.dart';
import 'package:flutter/material.dart';

class MySearchBAR extends StatelessWidget {
  const MySearchBAR({super.key, required this.onSearch});

  final Function(String)
      onSearch; // Deklarasi variabel onSearch sebagai fungsi yang menerima string sebagai argumen

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor, // Menggunakan warna dari constants.dart
        borderRadius:
            BorderRadius.circular(30), // Membuat border radius dengan nilai 30
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 5), // Memberikan padding horizontal 25 dan vertical 5
      child: Row(
        children: [
          const Icon(
            Icons.search, // Menampilkan icon search
            color: Colors.grey, // Memberikan warna abu-abu pada icon
            size: 30,
          ),
          const SizedBox(width: 10), // Memberikan jarak horizontal 10
          Flexible(
            flex: 4,
            child: TextField(
              onChanged:
                  onSearch, // Menggunakan fungsi onSearch saat nilai TextField berubah
              decoration: const InputDecoration(
                hintText: "Search...", // Memberikan hint text
                border: InputBorder.none, // Menghapus border pada input
              ),
            ),
          ),
          Container(), // Container kosong untuk menjaga posisi icon search tetap di kiri
        ],
      ),
    );
  }
}
