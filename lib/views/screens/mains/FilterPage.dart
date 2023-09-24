// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fetin/database/services/InternetServices.dart';
import 'package:fetin/models/SimpleModel.dart';
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
  final Future<double> _arrobaFuture = InternetServices().getArroba();
  final Future<List<SimpleObject>> _weightFuture =
      InternetServices().weightAnalysis();
  final Future<List<SimpleObject>> _expenseFuture =
      InternetServices().expenseAnalysis();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        popUpPage: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            FutureBuilder<double>(
              future: _arrobaFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Símbolo de carregamento
                } else if (snapshot.hasError) {
                  return Text('Erro ao buscar preço da arroba',
                      style: TextStyle(fontSize: 20));
                } else {
                  return Text(
                    'Preço da arroba: ${snapshot.data!.toStringAsFixed(2)} R\$/kg',
                    style: TextStyle(fontSize: 20),
                  );
                }
              },
            ),
            SizedBox(height: 25),
            FutureBuilder(
              future: _weightFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Símbolo de carregamento
                } else if (snapshot.hasError) {
                  return Text('Erro ao carregar dados');
                } else {
                  final List<SimpleObject> firstList = [
                    snapshot.data![0],
                    snapshot.data![2]
                  ];
                  final SimpleObject secondList = snapshot.data![1];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Análise dos pesos',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: chartFilter(firstList, secondList),
                      )
                    ],
                  );
                }
              },
            ),
            SizedBox(height: 25),
            FutureBuilder(
              future: _expenseFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Símbolo de carregamento
                } else if (snapshot.hasError) {
                  return Text('Erro ao carregar dados');
                } else {
                  final List<SimpleObject> firstList = [
                    snapshot.data![0],
                    snapshot.data![1]
                  ];
                  final SimpleObject secondList = snapshot.data![2];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Análise dos gastos',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: chartFilter(firstList, secondList),
                      )
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}
