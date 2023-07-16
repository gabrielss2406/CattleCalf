// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fetin/views/screens/NewCow.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar() : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  void _openNewCowWidget(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor:
          Colors.transparent, // Definindo o fundo como transparente
      isScrollControlled: true,
      builder: (BuildContext context) {
        return NewCow();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 120, 144, 72),
      centerTitle: true, // Centralizar o título
      title: Image.asset(
        'assets/logo.png',
        width: 30,
        height: 30,
      ),
      actions: [
        Ink(
          child: IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () => _openNewCowWidget(context),
          ),
        )
      ],
    );
  }
}
