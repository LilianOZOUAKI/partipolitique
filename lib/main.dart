// main.dart
import 'package:e_politique/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Parti Politique',
      // home: const HomePage3(),
      routerConfig: router,
      // ou utilise router si tu en as un
    );
  }
}
