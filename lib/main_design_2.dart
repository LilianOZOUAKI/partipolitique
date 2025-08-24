import 'package:flutter/material.dart';
import 'design_2/app_theme.dart';
import 'design_2/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parti Politique',
      theme: appTheme,
      home: const HomePage2(),
      // ou utilise router si tu en as un
    );
  }
}

