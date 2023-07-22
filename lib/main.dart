import 'package:flutter/material.dart';
import 'package:flutter_sesi_3/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Counter());
  }
}

class StackContoh extends StatelessWidget {
  const StackContoh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class CounterContoh extends StatefulWidget {
  const CounterContoh({super.key});

  @override
  State<CounterContoh> createState() => _CounterContohState();
}

class _CounterContohState extends State<CounterContoh> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$counter',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            child: const Text('Tambah'),
          ),
          EvenCounter(counter: counter),
        ],
      ),
    ));
  }
}

class EvenCounter extends StatelessWidget {
  const EvenCounter({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text('${counter.isEven}');
  }
}

class WarnaWarni extends StatefulWidget {
  const WarnaWarni({
    super.key,
  });

  @override
  State<WarnaWarni> createState() => _WarnaWarniState();
}

class _WarnaWarniState extends State<WarnaWarni> {
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: color,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  color = Colors.yellow;
                  debugPrint('Button ditekan');
                });
              },
              child: const Text('Ubah warna'))
        ],
      ),
    ));
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('HALOOOOOO'),
          const Text('HALOOOOOO'),
          const Text('HALOOOOOO'),
          const Text('HALOOOOOO'),
          const Text('HALOOOOOO'),
          const Text('HALOOOOOO'),
          const Text('HALOOOOOO'),
          const Text('HALOOOOOO'),
          const Text('HALOOOOOO'),
          const Text('HALOOOOOO'),
          const Text('HALOOOOOO'),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Spada'),
                const Text('Spada'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Colors.red,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/image_dummy.jpg',
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Tugas Pertama Flutter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Mudah bukan?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () => debugPrint('Button ditekan'),
            style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            child: const Icon(Icons.arrow_forward),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
