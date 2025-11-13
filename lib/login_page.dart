import 'package:flutter/material.dart';
import '../storage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();

  void handleLogin(BuildContext context) async {
    if (user.text == "admin" && pass.text == "admin") {
      await Storage.login();
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login gagal")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Login", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              TextField(controller: user, decoration: InputDecoration(labelText: "Username")),
              TextField(controller: pass, obscureText: true, decoration: InputDecoration(labelText: "Password")),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => handleLogin(context),
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
