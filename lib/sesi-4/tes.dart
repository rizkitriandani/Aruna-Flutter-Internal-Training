import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counterOutsideBuild = 0; // State declared outside build method

  void _incrementCounterOutsideBuild() {
    setState(() {
      _counterOutsideBuild++;
    });
  }

  @override
  Widget build(BuildContext context) {
    int counterInsideBuild = 0; 

    void incrementCounterInsideBuild() {
       setState(() {
        counterInsideBuild++;
      });
      // counterInsideBuild++;
      print('Counter inside build: $counterInsideBuild');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Example'),
      ),
      body: Column(
        children: [
          Text('Counter outside build: $_counterOutsideBuild'),
          ElevatedButton(
            onPressed: _incrementCounterOutsideBuild,
            child: const Text('Increment outside build'),
          ),
          const SizedBox(height: 16.0),
          Text('Counter inside build: $counterInsideBuild'),
          ElevatedButton(
            onPressed: incrementCounterInsideBuild,
            child: const Text('Increment inside build'),
          ),
        ],
      ),
    );
  }
}
