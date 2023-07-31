import 'package:flutter_sesi_3/sesi-5/home.dart';
import 'package:flutter_sesi_3/sesi-5/login.dart';
import 'package:flutter_sesi_3/sesi-5/tiga.dart';

import 'empat.dart';

var routes = {
  '/': (context) => const LoginPage(),
  '/home': (context) => const HomePage(),
  '/tiga': (context) => const HalamanTiga(),
  '/empat': (context) => const HalamanEmpat(),
};
