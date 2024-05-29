import 'package:ecommerce_mobile_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

String nama_barang = "";

class Description extends StatefulWidget {
  final String description;
  final Product product;
  const Description(
      {super.key, required this.description, required this.product});

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  String? storyText;

  @override
  void initState() {
    super.initState();
  }

  // Fungsi untuk menghasilkan deskripsi menggunakan model generatif Google
  Future<void> _generateDesc() async {
    try {
      nama_barang = widget.product.title;
      final model = GenerativeModel(
          model: 'gemini-pro',
          apiKey: "AIzaSyDmdRizLP1EOQ7w9gwcWlXWlI-mLbsyZHw");
      final content = [
        Content.text("Buat Deskripsi $nama_barang Sebanyak 100 Kata")
      ];
      final response = await model.generateContent(content);

      // Mengatur state untuk menampilkan deskripsi yang dihasilkan
      // await gemini.text("Buat Deskripsi $nama_barang Sebanyak 100 Kata");
      setState(() {
        storyText = response.text;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _generateDesc,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Generate Description',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          widget.description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        // Menampilkan deskripsi yang dihasilkan jika sudah tersedia
        if (storyText != null) Text(storyText!),
      ],
    );
  }
}
