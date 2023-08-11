import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sesi_3/sesi-6/api_service.dart';

class PassengerPage extends StatefulWidget {
  const PassengerPage({super.key});

  @override
  State<PassengerPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {
  final apiService = ApiServiceImpl();
  final List dataPassenger = [];
  bool isLoading = false;

  //make reusable snackbar
  void showSnackBar({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  getDataPassenger() async {
    setState(() {
      isLoading = true;
    });
    final response = await apiService.fetchPassengerData();
    final data = json.decode(response.body)['data'];
    setState(() {
      dataPassenger.addAll(data);
      isLoading = false;
    });
  }

  deletePassenger(int index) async {
    final response = await apiService.deleteUser(dataPassenger[index]['_id']);
    if (response.statusCode == 200) {
      setState(() {
        dataPassenger.removeAt(index);
      });
      showSnackBar(message: 'User deleted successfully');
    } else {
      showSnackBar(message: 'Failed to delete user');
    }
  }

  @override
  void initState() {
    getDataPassenger();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Page'),
      ),
      body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: dataPassenger.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(dataPassenger[index]['name']),
                        subtitle:
                            Text(dataPassenger[index]['trips'].toString()),
                        trailing: IconButton(
                          onPressed: () {
                            deletePassenger(index);
                          },
                          icon: const Icon(Icons.delete),
                        ));
                  })),
    );
  }
}
