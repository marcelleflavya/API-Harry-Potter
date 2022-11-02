import 'package:flutter/material.dart';
import 'package:atividade_flutter/src/page.dart';

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
        primarySwatch: Colors.red,
      ),
        home: const MyHomePage(title: 'App Harry Potter'),
    );
  }
}