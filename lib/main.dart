import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[100],
          title: const Text('JurnaPet'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(100),
            padding: const EdgeInsets.all(0),
            child: const Text(
              'Welcome to JournaPet! 🐣',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
