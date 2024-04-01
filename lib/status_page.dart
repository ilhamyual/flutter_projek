import 'package:flutter/material.dart';
import 'package:flutter_projek/biodata.dart';

class StatusPage extends StatefulWidget {
  final List<Biodata> biodata;

  StatusPage({required this.biodata});

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

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
    );
  }
}
