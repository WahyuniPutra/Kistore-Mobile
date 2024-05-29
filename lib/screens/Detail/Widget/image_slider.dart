import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Kelas MyImageSlider digunakan untuk menampilkan penggeser gambar (image slider)
class MyImageSlider extends StatelessWidget {
  final Function(int)
      onChange; // Callback yang dipanggil ketika halaman berubah
  final String image; // URL gambar untuk ditampilkan
  const MyImageSlider({
    super.key,
    required this.image,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged:
            onChange, // Menetapkan callback onPageChanged untuk mengubah halaman
        itemBuilder: (context, index) {
          return Hero(
            tag: image, // Tag digunakan untuk animasi Hero
            child: Image.network(
                image), // Menampilkan gambar dari URL yang diberikan
          );
        },
      ),
    );
  }
}
