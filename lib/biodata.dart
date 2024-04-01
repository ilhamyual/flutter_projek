import 'package:flutter/material.dart';
import 'api_service.dart'; // Pastikan pathnya sesuai

class Biodata {
  final String nik;
  final String nama;
  final String kecamatan;
  final String desa;
  final String tglLahir; // Format YYYY-MM-DD
  final String jekel;
  final String kota;

  Biodata({
    required this.nik,
    required this.nama,
    required this.kecamatan,
    required this.desa,
    required this.tglLahir,
    required this.jekel,
    required this.kota,
  });

  factory Biodata.fromJson(Map<String, dynamic> json) {
    return Biodata(
      nik: json['nik'],
      nama: json['nama'],
      kecamatan: json['kecamatan'],
      desa: json['desa'],
      tglLahir: json['tgl_lahir'],
      jekel: json['jekel'],
      kota: json['kota'],
    );
  }
}

class BiodataCard extends StatelessWidget {
  final Biodata biodata; // Menggunakan tipe Biodata

  BiodataCard({required this.biodata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(biodata.nama),
        subtitle: Text("NIK: ${biodata.nik}\n"
            "Desa: ${biodata.desa}, Kecamatan: ${biodata.kecamatan}\n"
            "Kota: ${biodata.kota}, Tanggal Lahir: ${biodata.tglLahir}\n"
            "Jenis Kelamin: ${biodata.jekel}"),
      ),
    );
  }
}

class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Widget'),
      ),
      body: FutureBuilder<List<Biodata>>(
        future:
            fetchBiodata(), // Ganti dengan fungsi untuk mengambil data biodata dari server
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return BiodataCard(biodata: snapshot.data![index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class BiodataPage extends StatelessWidget {
  final List<Biodata> biodata;

  BiodataPage({required this.biodata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Page'),
      ),
      body: ListView.builder(
        itemCount: biodata.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4, // Memberikan efek elevasi pada card
            margin: EdgeInsets.symmetric(
                vertical: 8, horizontal: 16), // Mengatur jarak antar card
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12), // Mengatur border radius card
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    biodata[index].nama,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "NIK: ${biodata[index].nik}\n"
                    "Desa: ${biodata[index].desa}\n"
                    "Kecamatan: ${biodata[index].kecamatan}\n"
                    "Kota: ${biodata[index].kota}\n"
                    "Tanggal Lahir: ${biodata[index].tglLahir}\n"
                    "Jenis Kelamin: ${biodata[index].jekel}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
