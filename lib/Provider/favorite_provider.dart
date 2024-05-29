import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favorites =
      []; // Ini adalah variabel _favorites yang menyimpan daftar produk favorit.
  List<Product> get favorites =>
      _favorites; // Ini adalah getter untuk mendapatkan daftar produk favorit.

  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      // Jika produk sudah ada dalam daftar favorit, maka hapus dari daftar.
      _favorites.remove(product);
    } else {
      // Jika produk belum ada dalam daftar favorit, tambahkan ke daftar.
      _favorites.add(product);
    }
    notifyListeners(); // Panggil notifyListeners() agar widget yang menggunakan provider ini di-update.
  }

  bool isExist(Product product) {
    final isExist = _favorites.contains(
        product); // Periksa apakah produk sudah ada dalam daftar favorit.
    return isExist;
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
