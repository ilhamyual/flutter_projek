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
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _buildBiodataList(),
          StatusPage(biodata: widget.biodata),
          ProfilPage(biodata: widget.biodata),
        ],
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
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
      ),
    );
  }

  Widget _buildBiodataList() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('Dashboard Page'),
          automaticallyImplyLeading: false,
          floating: true,
          pinned: true,
          snap: false,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
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
            childCount: widget.biodata.length,
          ),
        ),
      ],
    );
  }
}
