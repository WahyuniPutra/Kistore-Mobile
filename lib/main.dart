import 'package:ecommerce_mobile_app/Provider/cart_provider.dart'; // Import modul `cart_provider.dart` yang menyediakan provider untuk keranjang belanja.
import 'package:ecommerce_mobile_app/Provider/favorite_provider.dart'; // Import modul `favorite_provider.dart` yang menyediakan provider untuk daftar favorit.
import 'package:ecommerce_mobile_app/Provider/purchase_history.dart'; // Import modul `purchase_history.dart` yang menyediakan provider untuk riwayat pembelian.
import 'package:flutter/material.dart'; // Import modul flutter untuk mengakses library dasar dari Flutter.
import 'package:google_fonts/google_fonts.dart'; // Import modul `google_fonts.dart` untuk mengakses font yang disediakan oleh Google.
import 'package:provider/provider.dart'; // Import modul `provider.dart` untuk mengakses package Provider.

import 'screens/nav_bar_screen.dart'; // Import modul `nav_bar_screen.dart` yang merupakan layar navigasi aplikasi.

void main() {
  // Gemini.init(apiKey: 'AIzaSyDmdRizLP1EOQ7w9gwcWlXWlI-mLbsyZHw');

  runApp(
      const MyApp()); // Menjalankan aplikasi Flutter dengan class MyApp sebagai root widget.
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); // Konstruktor MyApp yang menerima parameter key opsional.

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) =>
                  CartProvider()), // Memberikan provider untuk CartProvider kepada widget tree menggunakan ChangeNotifierProvider.
          ChangeNotifierProvider(
              create: (_) =>
                  FavoriteProvider()), // Memberikan provider untuk FavoriteProvider kepada widget tree menggunakan ChangeNotifierProvider.
          ChangeNotifierProvider(
              create: (_) =>
                  PurchaseHistory()), // Memberikan provider untuk PurchaseHistory kepada widget tree menggunakan ChangeNotifierProvider.
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false, // Menonaktifkan banner debug.
          theme: ThemeData(
            textTheme: GoogleFonts
                .mulishTextTheme(), // Mengatur tema aplikasi dengan menggunakan font dari Google Fonts.
          ),
          home:
              const BottomNavBar(), // Menetapkan layar BottomNavBar sebagai halaman awal aplikasi.
        ),
      );
}
