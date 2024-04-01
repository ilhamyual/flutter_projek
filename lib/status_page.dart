import 'package:flutter/material.dart';
import 'package:flutter_projek/profil_page.dart';
import 'package:flutter_projek/biodata.dart';


class StatusPage extends StatefulWidget {
  final List<Biodata> biodata; 

  StatusPage({required this.biodata});
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  int _selectedIndex = 1; // Set nilai _selectedIndex ke 1

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) { // Jika tombol "Profil" dipilih
        Navigator.push( // Navigasi ke halaman profil
          context,
          MaterialPageRoute(builder: (context) => ProfilPage(biodata: widget.biodata)), // Ganti [] dengan data biodata yang sesuai jika tersedia
        );
      } else if (_selectedIndex == 0) { // Jika tombol "Dashboard" dipilih
        Navigator.push( // Navigasi ke halaman biodata
          context,
          MaterialPageRoute(builder: (context) => BiodataPage(biodata: widget.biodata)), // Berikan argumen biodata, isinya boleh kosong jika tidak ada data biodata yang tersedia
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status Page'),
         automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Status Page Content'),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
