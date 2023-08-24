import 'dart:convert';

import 'package:flutter/material.dart';

import 'api_service.dart';

class PassengerPage extends StatefulWidget {
  const PassengerPage({super.key});

  @override
  State<PassengerPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {
  final List passengerList = [];
  bool isLoading = false;
  ApiService apiService = ApiService();

  getPassengerData() async {
    setState(() {
      isLoading = true;
    });
    var response = await apiService.fetchPassengerData();
    if (response.statusCode == 200) {
      setState(() {
        passengerList.addAll(json.decode(response.body)['data']);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    getPassengerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passenger Page"),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: passengerList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(passengerList[index]['name']),
                    subtitle: Text(passengerList[index]['trips'].toString()),
                  );
                }),
      ),
    );
  }
}
