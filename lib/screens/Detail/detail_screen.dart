import 'package:ecommerce_mobile_app/constants.dart';
import 'package:ecommerce_mobile_app/models/product_model.dart';
import 'package:ecommerce_mobile_app/screens/Detail/Widget/addto_cart.dart';
import 'package:ecommerce_mobile_app/screens/Detail/Widget/description.dart';
import 'package:ecommerce_mobile_app/screens/Detail/Widget/detail_app_bar.dart';
import 'package:ecommerce_mobile_app/screens/Detail/Widget/image_slider.dart';
import 'package:ecommerce_mobile_app/screens/Detail/Widget/items_details.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen(
      {super.key,
      required this.product}); // Konstruktor untuk menerima data produk

  @override
  State<DetailScreen> createState() =>
      _DetailScreenState(); // Membuat state untuk detail screen
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0; // Inisialisasi variabel untuk indeks gambar
  int currentColor = 1; // Inisialisasi variabel untuk indeks warna
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          kcontentColor, // Gunakan warna latar belakang dari konstanta
      floatingActionButton: AddToCart(
          product: widget.product), // Tampilkan tombol tambah ke keranjang
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailAppBar(
              product: widget.product, // Tampilkan app bar detail produk
            ),
            MyImageSlider(
              image: widget.product.image, // Tampilkan slider gambar produk
              onChange: (index) {
                setState(() {
                  currentImage = index;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: currentImage == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentImage == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemsDetails(
                      product: widget.product), // Tampilkan detail item produk
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  const SizedBox(height: 25),
                  Description(
                    description: widget
                        .product.description, // Tampilkan deskripsi produk
                    product: widget.product,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
