import 'package:flutter/material.dart';
import 'package:flutter_sesi_3/sesi-5/home.dart';

import 'colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selamat Datang di Internal Training Flutter'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: const StadiumBorder()),
                child:
                    const Text("Masuk", style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
