import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FastLocationApp());
}

class FastLocationApp extends StatelessWidget {
  const FastLocationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // POR ENQUANTO: tela placeholder. Vamos trocar isso pela "initial/page" depois.
      home: const Scaffold(
        body: Center(child: Text('FastLocation — placeholder')),
      ),
    );
  }
}