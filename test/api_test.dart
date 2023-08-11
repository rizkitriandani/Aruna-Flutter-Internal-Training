// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchPassengerData() async {
  final response = await http.get(
      Uri.parse('https://api.instantwebtools.net/v1/passenger?page=0&size=10'));
  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
  } else {
    print('Request failed with status: ${response.statusCode}');
  }

  return response;
}

Future<void> addPassenger() async {
  final response = await http.post(
      Uri.parse('https://api.instantwebtools.net/v1/passenger'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({"name": "Mario Dandy", "trips": 250, "airline": 1}));
  if (response.statusCode == 200) {
    print('Passenger created successfully');
    print('Response data: ${response.body}');
  } else {
    print('Failed to create Passenger. Status: ${response.statusCode}');
    print('Response data: ${response.body}');
  }
}

Future<void> updatePassengerData(
    String userId, Map<String, dynamic> updatedData) async {
  final response = await http.put(
    Uri.parse('https://api.instantwebtools.net/v1/passenger/$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(updatedData),
  );

  if (response.statusCode == 200) {
    print('User updated successfully');
    print('Response data: ${response.body}');
  } else {
    print('Failed to update user. Status: ${response.statusCode}');
  }
}

Future<void> deleteUser(String userId) async {
  final response = await http.delete(
    Uri.parse('https://api.instantwebtools.net/v1/passenger/$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    print('User deleted successfully');
    print('Response data: ${response.body}');
  } else {
    print('Failed to delete user. Status: ${response.statusCode}');
    print('Response data: ${response.body}');
  }
}

void main() async {
  // await addPassenger();
  // fetchPassengerData();

  // await updatePassengerData("6465fe88b149ab80cb352cf9",
  //     {"name": "Mario", "trips": 250, "airline": 8});

  // await deleteUser("6465fe88b149ab80cb352cf9");
}
