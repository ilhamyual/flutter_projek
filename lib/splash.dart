import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_projek/landing_page.dart'; // Ganti dengan halaman utama aplikasi Anda

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Ganti 'HomeScreen()' dengan halaman utama aplikasi Anda
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LandingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 123, 6), // Ganti warna latar belakang sesuai keinginan Anda
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menggunakan Image.asset untuk menampilkan gambar dari assets
            Image.asset(
              'images/kabjember.png', // Sesuaikan dengan path gambar Anda
              width: 120, // Atur lebar gambar sesuai keinginan Anda
              height: 120, // Atur tinggi gambar sesuai keinginan Anda
            ),
            SizedBox(height: 20),
            Text(
              'NICE TRY APP', // Ganti dengan nama aplikasi Anda
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
