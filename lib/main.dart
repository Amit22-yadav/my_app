import 'package:flutter/material.dart';
import 'package:my_app/src/rust/api/simple.dart';
import 'package:my_app/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String greetResult = '';
  int sumResult = 0;

  @override
  void initState() {
    super.initState();
    _callRustFunctions();
  }

  Future<void> _callRustFunctions() async {
    final greeting = greet(name: "Tom"); // Sync function
    final sum = addNumbers(a: 5, b: 7);  // Sync function

    setState(() {
      greetResult = greeting;
      sumResult = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Rust greet("Tom"): $greetResult'),
              const SizedBox(height: 10),
              Text('Rust add_numbers(5, 7): $sumResult'),
            ],
          ),
        ),
      ),
    );
  }
}
