// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cattecalf/constants/Colors.dart';
import 'package:cattecalf/database/services/EconomyServices.dart';
import 'package:cattecalf/database/services/TypeServices.dart';
import 'package:cattecalf/models/ExpenseModel.dart';
import 'package:cattecalf/views/widgets/cardEconomy.dart';
import 'package:flutter/material.dart';
import 'package:cattecalf/views/widgets/chartEconomy.dart';
import 'package:cattecalf/views/widgets/appBar.dart';
import 'package:cattecalf/views/widgets/navBar.dart';

class EconomyPage extends StatefulWidget {
  const EconomyPage({super.key});

  @override
  State<EconomyPage> createState() => _EconomyPageState();
}

class _EconomyPageState extends State<EconomyPage> {
  List<EconomyData> data = [];
  List<Expense> expenseList = [];

  @override
  initState() {
    super.initState();

    EconomyServices.getExpenseListByUser().then((value) {
      expenseList = value;
    });

    TypeServices.getTypeList().then((value) {
      int cont = 0;
      for (var element in value) {
        data.add(EconomyData(
            element['type_name'].toString(),
            element['type_name'].toString(),
            (element['total_expenses'] as num?)?.toInt() ?? 0,
            COLORS[cont]));
        cont++;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        popUpPage: 1,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          chartData(data),
          Expanded(
            child: ListView.builder(
              itemCount: expenseList.length,
              itemBuilder: (context, index) {
                EdgeInsets margin = index == 0
                    ? EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 5)
                    : EdgeInsets.symmetric(vertical: 5, horizontal: 10);
                return Container(
                  height: 100,
                  margin: margin,
                  child: CardTwo(
                    expense: expenseList[index],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}
