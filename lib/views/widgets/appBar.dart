// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fetin/database/services/AuthServices.dart';
import 'package:fetin/database/syncData.dart';
import 'package:fetin/views/screens/mains/LoginPage.dart';
import 'package:fetin/views/screens/pop_ups/InsertNewCow.dart';
import 'package:fetin/views/screens/pop_ups/InsertNewEconomy.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.popUpPage});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  final int popUpPage;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  void _openWidget(BuildContext context, int type) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(125, 0, 0, 0),
      isScrollControlled: true,
      builder: (BuildContext context) {
        if (type == 0) {
          return NewCow();
        } else if (type == 1) {
          return NewEconomy();
        } else if (type == 2) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 120, 144, 72),
      centerTitle: true,
      title: Image.asset(
        'assets/logo.png',
        width: 30,
        height: 30,
      ),
      leading: Ink(
        child: IconButton(
          icon: Icon(Icons.logout),
          color: Colors.white,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Tem Certeza?'),
                  content: Text('Você tem certeza de que deseja fazer logout?'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Confirmar'),
                      onPressed: () {
                        AuthServices.logout(context);
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      actions: [
        Ink(
          child: IconButton(
            icon: Icon(Icons.sync),
            color: Colors.white,
            onPressed: () => synchronizeData(),
          ),
        ),
        widget.popUpPage == 0 || widget.popUpPage == 1
            ? Ink(
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () => _openWidget(context, widget.popUpPage),
                ),
              )
            : Container()
      ],
    );
  }
}
