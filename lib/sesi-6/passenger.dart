import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sesi_3/sesi-6/api_service.dart';

class PassengerPage extends StatelessWidget {
  const PassengerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiServiceImpl();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Page'),
      ),
      body: Center(
          child: FutureBuilder(
              future: apiService.fetchPassengerData(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  //Kita handling response dari API disini
                  List data = json.decode(snapshot.data.body)['data'];
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data[index]['name']),
                          subtitle: Text(data[index]['trips'].toString()),
                        );
                      });
                }
              }))),
    );
  }
}
