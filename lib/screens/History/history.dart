import 'package:ecommerce_mobile_app/Provider/purchase_history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({super.key}); // Constructor untuk kelas History

  @override
  Widget build(BuildContext context) {
    final purchaseHistory = Provider.of<PurchaseHistory>(
        context); // Menggunakan Provider untuk mendapatkan data PurchaseHistory

    return Scaffold(
      // Widget utama yang menampilkan halaman riwayat pembelian
      appBar: AppBar(
        // AppBar di bagian atas halaman
        title: const Text(
          // Judul AppBar
          "History", // Teks judul
          style: TextStyle(
            // Gaya teks judul
            fontWeight: FontWeight.bold, // Ketebalan teks judul
            fontSize: 25, // Ukuran teks judul
          ),
        ),
      ),
      body: ListView.builder(
        // Widget ListView untuk menampilkan daftar pembelian
        itemCount:
            purchaseHistory.purchases.length, // Jumlah item dalam ListView
        itemBuilder: (context, index) {
          // Metode untuk membangun item ListView
          final purchase = purchaseHistory.purchases[
              index]; // Mendapatkan objek pembelian dari indeks tertentu
          return ExpansionTile(
            // Widget ExpansionTile untuk menampilkan detail pembelian yang dapat diperluas
            title: Text('Total: \$${purchase.total}'),
            subtitle: Text('Date: ${purchase.dateTime}'),
            children: purchase.products.map((product) {
              return ListTile(
                // Widget ListTile untuk menampilkan detail produk
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
                leading: Image.network(product.image),
              );
            }).toList(), // Mengonversi iterable produk menjadi daftar
          );
        },
      ),
    );
  }
}
