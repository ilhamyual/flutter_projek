import 'package:flutter/material.dart';
import 'package:flutter_projek/registrasi/register_page.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  bool visibility = true;
  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Icon(Icons.person, size: 50),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: TextFormField(
              keyboardType: TextInputType.name,
              controller: nikController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  labelText: "Email",
                  hintText: "Masukkan Email",
                  prefixIcon: Icon(Icons.email_rounded)),
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
                      borderRadius: BorderRadius.circular(25.0)),
                  labelText: "Password",
                  hintText: "Masukkan Password",
                  prefixIcon: Icon(Icons.lock_rounded)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Belum punya akun? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => register_page()),
                    );
                  },
                  child: Text(
                    'Daftar disini',
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
          Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: ElevatedButton(
              onPressed: () {},
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
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
