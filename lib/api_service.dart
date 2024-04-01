import 'dart:convert';
import 'package:http/http.dart' as http;
import 'biodata.dart'; // Pastikan pathnya sesuai

Future<List<Biodata>> fetchBiodata() async {
  final response =
      await http.get(Uri.parse('http://yourserveraddress:5000/biodata'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Biodata.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load biodata from server');
  }
}
