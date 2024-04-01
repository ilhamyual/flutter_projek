import 'package:flutter/material.dart';
import 'package:flutter_projek/status_page.dart';
import 'package:flutter_projek/profil_page.dart';

class Biodata {
  final String nama;

  Biodata({
    required this.nama,
  });

  factory Biodata.fromJson(Map<String, dynamic> json) {
    return Biodata(
      nama: json['nama'],
    );
  }
}

class BiodataPage extends StatefulWidget {
  final List<Biodata> biodata;

  BiodataPage({required this.biodata});

  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  int _selectedIndex = 0;

  Widget _getPage(int index) {
    switch (index) {
      case 1:
        return StatusPage(biodata: widget.biodata);
      case 2:
        return ProfilPage(biodata: widget.biodata);
      default:
        return _buildBiodataList();
    }
  }

  Widget _buildBiodataList() {
    return ListView.builder(
      itemCount: widget.biodata.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.biodata[index].nama,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Nama: ${widget.biodata[index].nama}\n",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Page'),
         automaticallyImplyLeading: false,
      ),
      body: _getPage(_selectedIndex),
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
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 1) { // Jika tombol "Status" ditekan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StatusPage(biodata: widget.biodata),
                ),
              );
            } else if (index == 2) { // Jika tombol "Profil" ditekan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilPage(biodata: widget.biodata),
                ),
              );
            }
          });
        },
      ),
    );
  }
}
