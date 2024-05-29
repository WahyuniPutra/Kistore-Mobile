import 'dart:convert';

import 'package:http/http.dart' as http;

class Product {
  final String title; // Judul produk
  final String description; // Deskripsi produk
  final String image; // URL gambar produk
  final double price; // Harga produk
  double quantity; // Jumlah produk

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
  });
}

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse(
      'https://flutterwadidaw112.000webhostapp.com/api_toko/read.php')); // Meminta data produk dari URL API

  if (response.statusCode == 200) {
    // Jika koneksi berhasil
    final List<dynamic> data =
        jsonDecode(response.body); // Mendapatkan data JSON dari respons
    print(data); // Mencetak data (opsional, untuk debugging)

    return data
        .map(
          (item) => Product(
            title: item['title'], // Mengambil judul produk dari data JSON
            description: item[
                'description'], // Mengambil deskripsi produk dari data JSON
            image: item['image'], // Mengambil URL gambar produk dari data JSON
            price: double.parse(item[
                'price']), // Mengambil harga produk dari data JSON dan mengonversinya menjadi double
            quantity: double.parse(item[
                'quantity']), // Mengambil jumlah produk dari data JSON dan mengonversinya menjadi double
          ),
        )
        .toList(); // Mengonversi hasil pemetaan menjadi daftar produk
  } else {
    // Jika koneksi gagal
    throw Exception('Failed to load products'); // Melempar pengecualian
  }
}
