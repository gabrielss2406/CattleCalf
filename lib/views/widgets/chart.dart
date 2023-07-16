import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

Widget chartData(List<EconomyData> data) {
  final series = data.map((economyData) {
    return charts.Series(
      id: economyData.str,
      data: [economyData],
      domainFn: (EconomyData economy, _) => economy.type,
      measureFn: (EconomyData economy, _) => economy.economy,
      colorFn: (EconomyData economy, _) =>
          charts.ColorUtil.fromDartColor(economy.color),
    );
  }).toList();

  final barChart = charts.BarChart(
    series,
    animate: true,
    primaryMeasureAxis: charts.NumericAxisSpec(
      renderSpec: charts.GridlineRendererSpec(
        labelStyle: charts.TextStyleSpec(
          color: charts.Color.fromHex(
              code:
                  "#789048"), // Defina a cor desejada para a legenda do eixo de medida
        ),
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
    child: Container(
      height: 250,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: barChart,
    ),
  );
}

class EconomyData {
  final String str;
  final String type;
  final int economy;
  final MaterialColor color;

  EconomyData(this.str, this.type, this.economy, this.color);
}
