import 'package:flutter/material.dart';

class HalamanTiga extends StatelessWidget {
  const HalamanTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Halaman Tiga"),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/empat');
              },
              child: const Text("Ke Halaman Empat")),
        ],
      ),
    ));
  }
}
