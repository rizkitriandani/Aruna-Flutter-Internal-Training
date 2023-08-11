import 'package:flutter/material.dart';
import 'package:flutter_sesi_3/sesi-5/tiga.dart';

import '../sesi-4/counter.dart';
import '../sesi-6/passenger.dart';
import 'colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      {
        'imagePath': 'assets/counter_menu.png',
        'title': 'Counter',
        'onTap': () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Counter();
            }))
      },
      {
        'imagePath': 'assets/list_menu.png',
        'title': 'Passenger',
        'onTap': () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PassengerPage();
            }))
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderWidget(),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(
                      top: 50, left: 20, right: 20, bottom: 2),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 10),
                      itemCount: menus.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemMenuWidget(
                          imagePath: menus[index]['imagePath'] as String,
                          title: menus[index]['title'] as String,
                          onTap: menus[index]['onTap'] as Function(),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
                text: 'Welcome',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nInternal training Flutter',
                    style: TextStyle(
                        color: kPrimaryColorAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  )
                ]),
          ),
          Image.asset(
            'assets/header_home.jpg',
            width: 150,
          ),
        ],
      ),
    );
  }
}

class ItemMenuWidget extends StatelessWidget {
  const ItemMenuWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              imagePath,
            )),
        Text(title, style: const TextStyle(color: Colors.white)),
      ]),
    );
  }
}
