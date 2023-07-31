import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_counter',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => setState(() => _counter--),
                style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () => setState(() => _counter = 0),
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text('Reset'),
              ),
              ElevatedButton(
                onPressed: () => setState(() => _counter++),
                style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      )),
    );
  }
}
