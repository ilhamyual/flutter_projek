import 'package:flutter/material.dart';
import 'package:flutter_projek/login/login_page.dart'; 

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 152, 12),
      body: Stack(
        children: [
          Positioned(
            top: 200, // Atur posisi logo dan teks nama aplikasi dari atas
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  // Gambar atau logo Anda disini
                  Image.asset(
                    'images/kabjember.png', // Ganti dengan path gambar Anda
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 10),
                  // Nama aplikasi atau teks yang Anda inginkan
                  Text(
                    'NICE TRY APP',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Tombol untuk navigasi ke halaman login
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login_page()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 200),
                    decoration: BoxDecoration(
                      color: Colors.white, // Ubah warna sesuai kebutuhan
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold,),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Versi aplikasi atau informasi tambahan lainnya
                Text(
                  'Versi 1.0',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
                ),
                SizedBox(height: 20), // Atur jarak antara teks versi dan bagian bawah layar
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LandingPage(),
  ));
}
