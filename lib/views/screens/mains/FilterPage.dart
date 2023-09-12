// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fetin/views/widgets/chartFilter.dart';
import 'package:flutter/material.dart';
import 'package:fetin/views/widgets/appBar.dart';
import 'package:fetin/views/widgets/navBar.dart';
import 'package:fl_chart/fl_chart.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<FlSpot> mySpots0 = [
    FlSpot(1, 1),
    FlSpot(2, 3),
    FlSpot(3, 2),
    FlSpot(4, 4),
    FlSpot(5, 2),
    FlSpot(6, 3),
    FlSpot(7, 1),
    FlSpot(8, 3),
    FlSpot(9, 4),
    FlSpot(10, 2),
    FlSpot(11, 1),
    FlSpot(12, 3),
  ];

  List<FlSpot> mySpots1 = [
    FlSpot(1, 5),
    FlSpot(2, 2),
    FlSpot(3, 3),
    FlSpot(4, 3),
    FlSpot(5, 3),
    FlSpot(6, 4),
    FlSpot(7, 5),
    FlSpot(8, 3),
    FlSpot(9, 2),
    FlSpot(10, 2),
    FlSpot(11, 1),
    FlSpot(12, 3),
  ];

  List<FlSpot> mySpots2 = [
    FlSpot(1, 1),
    FlSpot(2, 3),
    FlSpot(3, 2),
    FlSpot(4, 4),
    FlSpot(5, 2),
    FlSpot(6, 3),
    FlSpot(7, 5),
    FlSpot(8, 3),
    FlSpot(9, 2),
    FlSpot(10, 2),
    FlSpot(11, 1),
    FlSpot(12, 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        popUpPage: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            chartFilter("Consumo Mensal por Gado", Colors.amber, mySpots0),
            chartFilter("Gasto Mensal por Gado", Colors.green, mySpots1),
            chartFilter("Desvio Padrão dos Gastos", Colors.brown, mySpots2),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}
