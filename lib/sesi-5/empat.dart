import 'package:flutter/material.dart';

class HalamanEmpat extends StatelessWidget {
  const HalamanEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Halaman Empat"),
          ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text("Kembali")),
        ],
      ),
    ));
  }
}
