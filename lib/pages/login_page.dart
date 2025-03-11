import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _confirmLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Username dan Password harus diisi!")),
      );
      return;
    }

    // Menampilkan Alert Dialog sebelum login
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Login"),
          content: Text(
            "Apakah Anda yakin?",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Tutup dialog
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                _login(); // Panggil fungsi login
              },
              child: Text("Ya"),
            ),
          ],
        );
      },
    );
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == "user" && password == "123") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Berhasil !")),
      );
      return;
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Gagal, Silahkan Periksa Username Atau Password !")),
      );
      return;
    }
    

    // Tambahkan logika validasi atau kirim data ke backend
  }


  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Login Page"
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              Image.asset(
                "assets/login_logo.png",
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              Text("Welcome", style: TextStyle(fontSize: 25)),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/username.png", // Pastikan nama file benar
                          height: 24, // Ukuran lebih proporsional
                          width: 24,
                        ),
                        SizedBox(width: 10), // Spasi antara ikon dan input
                        Expanded(
                          child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Username",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/padlock.png", // Pastikan nama file benar
                          height: 24, // Ukuran lebih proporsional
                          width: 24,
                        ),
                        SizedBox(width: 10), // Spasi antara ikon dan input
                        Expanded(
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Password",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              ElevatedButton(
                onPressed: _confirmLogin,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 60),
                  backgroundColor: Colors.blue.shade100,
                ),
                child: Text("Login", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      )
    );
  }
}