import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

// Kelas CartProvider bertanggung jawab atas manajemen keranjang belanja.
class CartProvider extends ChangeNotifier {
  // Variabel privasi untuk menyimpan produk dalam keranjang.
  final List<Product> _cart = [];
  // Getter untuk mengakses daftar produk dalam keranjang.
  List<Product> get cart => _cart;
  // Metode untuk menambahkan atau menghapus produk dari keranjang.
  void toggleFavorite(Product product) {
    if (_cart.contains(product)) {
      // Jika produk sudah ada dalam keranjang, tingkatkan jumlahnya.
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      // Jika produk belum ada dalam keranjang, tambahkan ke keranjang.
      _cart.add(product);
    }
    // Panggil notifyListeners() untuk memberitahu widget yang mendengarkan tentang perubahan.
    notifyListeners();
  }

  // Metode untuk menambahkan jumlah produk.
  incrementQtn(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  // Metode untuk mengurangi jumlah produk.
  decrementQtn(int index) {
    if (_cart[index].quantity <= 1) {
      return;
    }
    _cart[index].quantity--;
    notifyListeners();
  }

  // Metode untuk menghitung total harga semua produk dalam keranjang.
  totalPrice() {
    double total1 = 0.0;
    for (Product element in _cart) {
      total1 += element.price * element.quantity;
    }
    return total1;
  }

  // Metode untuk mendapatkan instance CartProvider dari BuildContext.
  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }

  // Metode untuk membersihkan keranjang belanja.
  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
