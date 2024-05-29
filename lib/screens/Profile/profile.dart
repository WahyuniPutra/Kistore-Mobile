import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  //Dalam method build, kelas ini mengembalikan sebuah Scaffold yang berisi sebuah Stack.
  //Di dalam Stack, ada sebuah gambar yang diambil dari asset dengan fitur yang telah diatur.
  //Di atasnya, ada sebuah Card yang berisi informasi tentang kelompok, seperti judul mata kuliah dan anggota kelompok.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/karina.jpg",
            fit: BoxFit.cover,
            height: size.height,
            width: size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color.fromARGB(255, 255, 255, 255)
                    .withOpacity(0.5), // Opasitas sekitar 80%
                elevation: 8,
                child: Container(
                  height: size.height,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(),
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 8), // Spasi antara ikon dan teks
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Pemrograman Web dan Mobile I",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              "Anggota Kelompok:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black45),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "1. Atong Nazarius (223010503019) \n2. Wahyuni Putra (223010503020) \n3. Ferry Saputra (223010503025) \n4. Rifky Mustaqim Handoko (223010503028) \n5. Ryan Delon Pratama (223020503059)",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Divider(
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox friendAndMore(title, number) {
    return SizedBox(
      width: 110,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black26),
          ),
          Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
