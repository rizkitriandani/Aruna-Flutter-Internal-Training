import 'package:flutter/material.dart';

class UbahWarna extends StatefulWidget {
  const UbahWarna({
    super.key,
  });

  @override
  State<UbahWarna> createState() => _UbahWarnaState();
}

class _UbahWarnaState extends State<UbahWarna> {
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: color,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (color == Colors.red) {
                    color = Colors.yellow;
                  } else if (color == Colors.yellow) {
                    color = Colors.green;
                  } else {
                    color = Colors.red;
                  }
                  debugPrint('Button ditekan, value color : ${color.value}');
                  setState(() {});
                },
                child: const Text('Ubah warna'))
          ],
        ),
      ),
    );
  }
}
