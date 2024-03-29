import 'package:cattecalf/views/screens/mains/EconomyPage.dart';
import 'package:cattecalf/views/screens/SplashScreen.dart';
import 'package:cattecalf/views/screens/mains/LoginPage.dart';
import 'package:cattecalf/views/screens/mains/RegisterPage.dart';
import 'package:cattecalf/views/screens/mains/StartPage.dart';
import 'package:cattecalf/views/screens/mains/FilterPage.dart';
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
      initialRoute: '/splash',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/splash': (context) => SplashScreen(),
        '/start': (context) => StartPage(),
        '/economy': (context) => EconomyPage(),
        '/filter': (context) => FilterPage(),
      },
      theme: ThemeData(primarySwatch: Colors.brown),
    );
  }
}
