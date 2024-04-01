import 'package:flutter/material.dart';
import 'package:flutter_projek/status_page.dart';
import 'package:flutter_projek/biodata.dart'; 

class ProfilPage extends StatefulWidget {
  final List<Biodata> biodata; 

  ProfilPage({required this.biodata});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index, BuildContext context) { // Tambahkan BuildContext sebagai parameter
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) { 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StatusPage(biodata: widget.biodata)),
        );
      } else if (_selectedIndex == 0) { 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BiodataPage(biodata: widget.biodata)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Profil'),
         automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Konten Halaman Profil'),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dasbor',
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
        onTap: (index) => _onItemTapped(index, context), // Perbarui pemanggilan _onItemTapped
      ),
    );
  }
}
