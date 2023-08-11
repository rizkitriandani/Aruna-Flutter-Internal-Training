import 'package:flutter/material.dart';

class PassengerPage extends StatelessWidget {
  const PassengerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Page'),
      ),
      body: const Center(child: Text('Halaman data passenger')),
    );
  }
}
