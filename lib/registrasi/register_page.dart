import 'package:flutter/material.dart';
import 'package:flutter_projek/login/login_page.dart';

class register_page extends StatefulWidget {
  const register_page({Key? key}) : super(key: key);

  @override
  _register_pageState createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  TextEditingController nikController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController tlpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  String genderValue = 'Laki-laki';
  DateTime? selectedDate;
  TextEditingController addressController = TextEditingController();
  bool visibility = true;
  final _formKey = GlobalKey<FormState>();


  late Future<List<String>> kecamatanListFuture;
  String? selectedKecamatan;
  
  late Future<List<String>> desaListFuture;
  String? selectedDesa;


//nyoba nyoba doang ini
  Future<List<String>> fetchKecamatanFromDatabase() async {
  // Fungsi untuk mengambil data kecamatan dari database
  // Implementasikan sesuai dengan logika pengambilan data dari database Anda
  // Contoh: dapat menggunakan package http untuk melakukan request ke API
  // Misalnya:
  // final response = await http.get('https://example.com/kecamatan');
  // final List<String> kecamatanList = parseKecamatanFromResponse(response.body);
  // return kecamatanList;

  // Contoh sederhana:
  return Future.delayed(Duration(seconds: 1), () {
    return ['Kecamatan A', 'Kecamatan B', 'Kecamatan C'];
  });
  }

  @override
  void initState() {
    super.initState();
    kecamatanListFuture = fetchKecamatanFromDatabase();
  // Misalkan Kecamatan awal adalah yang pertama dari list Kecamatan
    desaListFuture = fetchDesaFromDatabase('Kecamatan A');
  }

  Future<List<String>> fetchDesaFromDatabase(String kecamatan) async {
  // Fungsi untuk mengambil data desa dari database berdasarkan kecamatan
  // Implementasikan sesuai dengan logika pengambilan data dari database Anda
  // Contoh: dapat menggunakan package http untuk melakukan request ke API
  // Misalnya:
  // final response = await http.get('https://example.com/desa?kecamatan=$kecamatan');
  // final List<String> desaList = parseDesaFromResponse(response.body);
  // return desaList;

  // Contoh sederhana:
  return Future.delayed(Duration(seconds: 1), () {
    if (kecamatan == 'Kecamatan A') {
      return ['Desa 1A', 'Desa 2A', 'Desa 3A'];
    } else if (kecamatan == 'Kecamatan B') {
      return ['Desa 1B', 'Desa 2B', 'Desa 3B'];
    } else if (kecamatan == 'Kecamatan C') {
      return ['Desa 1C', 'Desa 2C', 'Desa 3C'];
    } else {
      return []; // Kembalikan list kosong jika kecamatan tidak valid atau tidak ditemukan
    }
  });
}

//ketas nyoba nyoba

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      case 12:
        return 'Desember';
      default:
        return '';
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _showRegistrationSuccessDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registrasi Berhasil'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Registrasi Anda berhasil.'),
                Text('Klik Ok untuk melanjutkan ke Login.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _saveRegistrationData() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => login_page()),
    );

    _showRegistrationSuccessDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Icon(Icons.person, size: 50),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  autofocus: true,
                  controller: nikController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "NIK",
                    hintText: "Masukkan NIK",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi bidang ini';
                    } else if (value.length != 16 ||
                        int.tryParse(value) == null) {
                      return 'NIK harus terdiri dari 16 angka';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "Nama",
                    hintText: "Masukkan Nama Anda",
                    prefixIcon: Icon(Icons.person_2_sharp),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi bidang ini';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  autofocus: true,
                  controller: tlpController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "No Telepon",
                    hintText: "Masukkan No Telepon Anda",
                    prefixIcon: Icon(Icons.call),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi bidang ini';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "Email",
                    hintText: "Masukkan Email Anda",
                    prefixIcon: Icon(Icons.email_rounded),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi bidang ini';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Masukkan email dengan format yang valid';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: passwordController,
                  obscureText: visibility,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: visibility
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "Password",
                    hintText: "Masukkan Password Anda",
                    prefixIcon: Icon(Icons.lock_rounded),
                    errorMaxLines: 3,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi bidang ini';
                    } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{8,}$')
                        .hasMatch(value)) {
                      return 'Password harus terdiri dari minimal satu huruf besar, satu angka, dan memiliki panjang minimal 8 karakter';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: confirmpasswordController,
                  obscureText: visibility,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: visibility
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "Konfirmasi Password",
                    hintText: "Masukkan Password Anda",
                    prefixIcon: Icon(Icons.lock_rounded),
                    errorMaxLines: 3,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi bidang ini';
                    } else if (value != passwordController.text) {
                      return 'Password tidak cocok';
                    }
                    return null;
                  },
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: DropdownButtonFormField<String>(
                  value: genderValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      genderValue = newValue!;
                    });
                  },
                  items: <String>['Laki-laki', 'Perempuan']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "Gender",
                    prefixIcon: genderValue == 'Laki-laki'
                        ? Icon(Icons.male_rounded)
                        : Icon(Icons.female_rounded),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: TextFormField(
                      controller: TextEditingController(
                        text: selectedDate != null
                            ? "${selectedDate!.day} ${getMonthName(selectedDate!.month)} ${selectedDate!.year}"
                            : '',
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: "Tanggal Lahir",
                        prefixIcon: Icon(Icons.calendar_month_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Harap isi bidang ini';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: FutureBuilder<List<String>>(
                  future: kecamatanListFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Menampilkan loading indicator selama data diambil dari database
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return DropdownButtonFormField<String>(
                        value: selectedKecamatan,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedKecamatan = newValue!;
                          });
                        },
                        items: snapshot.data!.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          labelText: "Kecamatan",
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      );
                    }
                  },
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: FutureBuilder<List<String>>(
                  future: desaListFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Menampilkan loading indicator selama data diambil dari database
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return DropdownButtonFormField<String>(
                        value: selectedDesa,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDesa = newValue!;
                          });
                        },
                        items: snapshot.data!.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          labelText: "Desa",
                          prefixIcon: Icon(Icons.location_city),
                        ),
                      );
                    }
                  },
                ),
              ),


              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: addressController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "Alamat Lengkap",
                    hintText: "Masukkan Alamat Lengkap Anda",
                    prefixIcon: Icon(Icons.maps_home_work),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi bidang ini';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Sudah punya akun? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login disini',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveRegistrationData();
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 200.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
