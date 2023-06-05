import 'package:cattlecalf/views/screens/HomePage.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CattleCalf",
      initialRoute: '/',//onde vai comecar o app
      routes: {
        '/': (context) => const HomePage(),
      },
      //},
    );
  } // Build
} // Stateless