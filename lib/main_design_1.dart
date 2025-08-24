// main.dart
import 'package:flutter/material.dart';

import 'router.dart';

void main() {
  runApp(const PartiPolitiqueApp());
}

class PartiPolitiqueApp extends StatelessWidget {
  const PartiPolitiqueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Parti Politique',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      routerConfig: router,
    );
  }
}
