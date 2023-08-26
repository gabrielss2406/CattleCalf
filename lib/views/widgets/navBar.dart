// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fetin/views/screens/mains/EconomyPage.dart';
import 'package:fetin/views/screens/mains/FilterPage.dart';
import 'package:fetin/views/screens/mains/StartPage.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  NavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  State<NavBar> createState() => _navbarState();
}

int _currentIndex = 0;

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  CustomPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class _navbarState extends State<NavBar> {
  void _navigateToPage(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navegação para as páginas correspondentes com animação personalizada
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          CustomPageRoute(builder: (context) => StartPage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          CustomPageRoute(builder: (context) => EconomyPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          CustomPageRoute(builder: (context) => FilterPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 120, 144, 72),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      child: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 192, 216, 96),
        onTap: _navigateToPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            label: "",
          ),
        ],
      ),
    );
  }
}
