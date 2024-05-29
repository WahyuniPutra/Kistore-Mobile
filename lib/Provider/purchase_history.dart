import 'package:ecommerce_mobile_app/models/product_model.dart';
import 'package:flutter/material.dart';

class PurchaseHistory extends ChangeNotifier {
  final List<Purchase> _purchases =
      []; // Penjelasan: Ini adalah list yang menyimpan riwayat pembelian.

  List<Purchase> get purchases =>
      _purchases; // Penjelasan: Ini adalah getter untuk mendapatkan daftar pembelian.

  void addPurchase(Purchase purchase) {
    _purchases.add(
        purchase); // Penjelasan: Metode ini menambahkan pembelian baru ke dalam daftar dan memberitahukan pengamat.
    notifyListeners(); // Penjelasan: Memberi tahu pengamat bahwa terjadi perubahan pada daftar pembelian.
  }
}

class Purchase {
  final List<Product>
      products; // Penjelasan: List produk yang dibeli dalam satu transaksi.
  final double total; // Penjelasan: Total harga pembelian.
  final DateTime dateTime; // Penjelasan: Waktu pembelian.

  Purchase(
      {required this.products, required this.total, required this.dateTime});
}
