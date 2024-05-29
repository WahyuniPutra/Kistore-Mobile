import 'package:ecommerce_mobile_app/Provider/purchase_history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/cart_provider.dart';
import '../../constants.dart';
import '../../models/product_model.dart';

class CheckOutBox extends StatelessWidget {
  const CheckOutBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance dari CartProvider dari context
    final provider = CartProvider.of(context);
    // Mendapatkan daftar produk yang ada di keranjang belanja
    final finalList = provider.cart;

    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Subtotal",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                "\$${provider.totalPrice()}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${provider.totalPrice()}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Mendapatkan instance dari PurchaseHistory dari Provider
              final purchaseHistory =
                  Provider.of<PurchaseHistory>(context, listen: false);
              // Mendapatkan total harga pembelian
              final total = provider.totalPrice();
              // Mengonversi daftar produk yang dibeli menjadi objek Product
              final purchaseProducts = finalList.map((product) {
                return Product(
                  title: product.title,
                  price: product.price,
                  description: product.description,
                  image: product.image,
                  quantity: product.quantity,
                );
              }).toList();
              // Membuat objek pembelian baru
              final purchase = Purchase(
                  products: purchaseProducts,
                  total: total,
                  dateTime: DateTime.now());
              // Menambahkan pembelian ke riwayat pembelian
              purchaseHistory.addPurchase(purchase);
              // Mengosongkan keranjang belanja setelah pembelian selesai
              provider.clearCart();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimaryColor,
              minimumSize: const Size(double.infinity, 55),
            ),
            child: const Text(
              "Check out",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
