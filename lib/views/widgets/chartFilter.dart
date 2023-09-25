// ignore_for_file: prefer_const_constructors

import 'package:fetin/constants/Colors.dart';
import 'package:fetin/models/SimpleModel.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

Widget chartFilter(List<SimpleObject> data, SimpleObject variance) {
  final series = data.map((sData) {
    return charts.Series(
      id: "${sData.name}\n${sData.value.toStringAsFixed(2)}",
      data: [sData],
      domainFn: (SimpleObject object, _) => object.name,
      measureFn: (SimpleObject object, _) => object.value,
      colorFn: (SimpleObject object, _) =>
          charts.ColorUtil.fromDartColor(COLORS[object.id - 1]),
    );
  }).toList();

  final formato = NumberFormat('#,###', "pt_BR");

  final barChart = charts.BarChart(
    series,
    animate: true,
    primaryMeasureAxis: charts.NumericAxisSpec(
      renderSpec: charts.GridlineRendererSpec(
        labelStyle:
            charts.TextStyleSpec(color: charts.Color.fromHex(code: "#789048")),
      ),
    ),
    domainAxis: const charts.OrdinalAxisSpec(
      renderSpec: charts.NoneRenderSpec(),
    ),
    barGroupingType: charts.BarGroupingType.groupedStacked,
    behaviors: [
      charts.SeriesLegend(
        position: charts.BehaviorPosition.end,
        horizontalFirst: false,
        cellPadding: const EdgeInsets.only(right: 0, bottom: 4.0),
      ),
    ],
  );

  return Center(
    child: Column(
      children: [
        Container(
          height: 250,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromARGB(255, 120, 144, 72),
            ),
          ),
          child: barChart,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 120, 144, 72),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            variance.name.contains("Custo")
                ? '${variance.name}: ${variance.value.toStringAsFixed(2).replaceAll(".", ",")} R\$/Kg'
                : '${variance.name}: ${formato.format(variance.value)} Kg',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}
