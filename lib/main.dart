import 'package:flutter/material.dart';
import 'package:flutter_sesi_3/sesi-5/empat.dart';
import 'package:flutter_sesi_3/sesi-5/home.dart';

import 'package:flutter_sesi_3/sesi-5/login.dart';
import 'package:flutter_sesi_3/sesi-5/routes.dart';
import 'package:flutter_sesi_3/sesi-5/tiga.dart';

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
