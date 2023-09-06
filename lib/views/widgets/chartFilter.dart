// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

Widget chartFilter(
    String textChart, MaterialColor colorChart, List<FlSpot> spots) {
  return Center(
    child: Container(
      height: 250,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 120, 144, 72),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              textChart,
              style: TextStyle(
                color: colorChart,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    dotData: const FlDotData(
                      show: true,
                    ),
                    color: colorChart,
                    barWidth: 5,
                  ),
                ],
                borderData: FlBorderData(
                  border: Border.all(
                    width: 0,
                  ),
                ),
                titlesData: const FlTitlesData(
                  show: false,
                ),
                gridData: const FlGridData(
                  show: false,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class FilterData {
  final int x;
  final int y;

  FilterData(this.x, this.y);
}
