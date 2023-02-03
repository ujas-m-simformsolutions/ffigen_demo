import 'dart:math';

import 'package:ffigen_demo/swift_api_bindings.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SwiftLibrary swiftLibrary;

  @override
  void initState() {
    super.initState();
    swiftLibrary =
        SwiftLibrary(DynamicLibrary.executable());
  }

  int _counter = 0;

  void _incrementCounter() {
    final obj = Addition.new1(swiftLibrary);
    final result = obj.addWithA_b_(5, 10 + _counter * Random().nextInt(10));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(result.toString()),
      duration: const Duration(seconds: 5),
    ));
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
