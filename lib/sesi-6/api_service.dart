import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ApiService {
  Future fetchPassengerData();
  Future<void> addPassenger();
  Future<void> updatePassengerData(
      String userId, Map<String, dynamic> updatedData);
  Future<void> deleteUser(String userId);
}

class ApiServiceImpl extends ApiService {
  @override
  Future addPassenger() async {
    final response = await http.get(Uri.parse(
        'https://api.instantwebtools.net/v1/passenger?page=0&size=10'));
    if (response.statusCode == 200) {
      print('Response data: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

    return response;
  }

  @override
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

  @override
  Future fetchPassengerData() async {
    final response = await http.get(Uri.parse(
        'https://api.instantwebtools.net/v1/passenger?page=0&size=10'));
    if (response.statusCode == 200) {
      print('Response data: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

    return response;
  }

  @override
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
}
