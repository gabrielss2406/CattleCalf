// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fetin/database/services/EconomyServices.dart';
import 'package:fetin/models/ExpenseModel.dart';
import 'package:fetin/views/widgets/cardEconomy.dart';
import 'package:flutter/material.dart';
import 'package:fetin/views/widgets/chart.dart';
import 'package:fetin/views/widgets/appBar.dart';
import 'package:fetin/views/widgets/navBar.dart';

class EconomyPage extends StatefulWidget {
  const EconomyPage({super.key});

  @override
  State<EconomyPage> createState() => _EconomyPageState();
}

class _EconomyPageState extends State<EconomyPage> {
  List<Expense> expenseList = [];

  @override
  initState() {
    super.initState();

    EconomyServices.getExpenseListByUser().then((value) {
      expenseList = value;
      setState(() {});
    });
  }

  final List<EconomyData> data = [
    EconomyData('Vacune', 'Vacune', 100, Colors.pink),
    EconomyData('Portion', 'Portion', 50, Colors.red),
    EconomyData('Energy', 'Energy', 30, Colors.amber),
    EconomyData('Water', 'Water', 20, Colors.cyan),
    EconomyData('Materials', 'Materials', 200, Colors.deepOrange),
    EconomyData('Salt', 'Salt', 80, Colors.green),
    EconomyData('Others', 'Others', 55, Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 216),
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
                  child: CardTwo(expense: expenseList[index],),
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
