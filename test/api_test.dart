// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchPassengerData() async {
  final response = await http.get(
      Uri.parse('https://api.instantwebtools.net/v1/passenger?page=0&size=10'));
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.body);
    throw Exception('Failed to load data');
  }
}

Future addPassenger() async {
  final response = await http.post(
      Uri.parse('https://api.instantwebtools.net/v1/passenger'),
      body: json.encode({"name": "Ujang", "trips": 250, "airline": 1}),
      headers: {"Content-Type": "application/json; charset=UTF-8"});
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.body);
    throw Exception('Failed to load data');
  }
}

Future updatePassenger(String userId, Map<String, dynamic> updatedData) async {
  final response = await http.put(
      Uri.parse('https://api.instantwebtools.net/v1/passenger/$userId'),
      body: json.encode(updatedData),
      headers: {"Content-Type": "application/json; charset=UTF-8"});
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.body);
    throw Exception('Failed to load data');
  }
}

Future deletePassenger(String userId) async {
  final response = await http.delete(
      Uri.parse('https://api.instantwebtools.net/v1/passenger/$userId'),
      headers: {"Content-Type": "application/json; charset=UTF-8"});
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.body);
    throw Exception('Failed to delete data');
  }
}

void main() {
  print("Hello World");
  // fetchPassengerData();
  // addPassenger();
  // updatePassenger('64d6008db7431429a02ac1a0',
  //     {"name": "Ujang", "trips": 400, "airline": 5});

  deletePassenger('64d6008db7431429a02ac1a0');
}
