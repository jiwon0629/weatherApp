import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Loading(),
    );
  }
}
