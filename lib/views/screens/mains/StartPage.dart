// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field
import 'package:cattecalf/constants/AppSharedPreferences.dart';
import 'package:cattecalf/views/widgets/appBar.dart';
import 'package:cattecalf/views/widgets/navBar.dart';
import 'package:cattecalf/views/widgets/cardCow.dart';
import 'package:cattecalf/database/services/AuthServices.dart';
import 'package:flutter/material.dart';

import '../../../database/services/CattleServices.dart';
import '../../../models/CattleModel.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Cattle> cattleList = [];
  String _searchQuery = '';
  bool _showNewCow = false;

  @override
  initState() {
    super.initState();
    // Exec async funcions
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // TEMP CODE (Login) ================================
      AuthServices.verifyLogged().then(
        (value) {
          if (value) {
            print("Já logado!!");
            // Navigator
          } else {
            print("Fazendo login...");
            AppSharedPreferences.saveUser("02126632679");
          }
        },
      );
      // ===================================================

      CattleServices.getCattleListByUser().then((value) {
        cattleList = value;
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        popUpPage: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cattleList.length,
              itemBuilder: (context, index) {
                EdgeInsets margin = index == 0
                    ? EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 5)
                    : EdgeInsets.symmetric(vertical: 5, horizontal: 15);
                return Container(
                  height: 100,
                  margin: margin,
                  child: CardOne(cattle: cattleList[index]),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
