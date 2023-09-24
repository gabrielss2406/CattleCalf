import 'package:fetin/constants/Colors.dart';
import 'package:fetin/models/SimpleModel.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

Widget chartFilter(List<SimpleObject> data, SimpleObject variance) {
  final series = data.map((sData) {
    return charts.Series(
      id: "${sData.name}\n${sData.value.toStringAsFixed(2)}",
      data: [sData],
      domainFn: (SimpleObject object, _) => object.name,
      measureFn: (SimpleObject object, _) => object.value,
      colorFn: (SimpleObject object, _) =>
          charts.ColorUtil.fromDartColor(COLORS[object.id-1]),
    );
  }).toList();

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
        ), // Espaço entre o gráfico e a string extra
        Text(
          '${variance.name}: ${variance.value.toStringAsFixed(3)}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
