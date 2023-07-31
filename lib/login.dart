import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sesi_3/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const HomePage()));

                  // Navigator.pushNamed(context, '/home');
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  // Navigator.pushReplacementNamed(context, '/home');
                  Navigator.popAndPushNamed(context, '/home');
                },
                child: const Text("Masuk")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Kembali")),
          ],
        ),
      ),
    );
  }
}
