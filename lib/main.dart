import 'package:flutter/material.dart';
import 'package:flutter_sesi_3/empat.dart';
import 'package:flutter_sesi_3/home.dart';

import 'package:flutter_sesi_3/login.dart';
import 'package:flutter_sesi_3/routes.dart';
import 'package:flutter_sesi_3/tiga.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: routes,
    );
    return materialApp;
  }
}
