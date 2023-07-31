import 'package:flutter_sesi_3/home.dart';
import 'package:flutter_sesi_3/login.dart';
import 'package:flutter_sesi_3/tiga.dart';

import 'empat.dart';

var routes = {
  '/': (context) => const LoginPage(),
  '/home': (context) => const HomePage(),
  '/tiga': (context) => const HalamanTiga(),
  '/empat': (context) => const HalamanEmpat(),
};
