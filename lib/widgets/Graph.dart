import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';



class Graphing extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _GraphingState createState() => _GraphingState();
}

class _GraphingState extends State<Graphing> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 16, 0, 20),
      color:  Color.fromRGBO(143, 163, 253, 1),
      alignment: Alignment.topLeft,
      child: SafeArea(
          child: Scaffold(
              body: SfCartesianChart(
                //legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                enableAxisAnimation: false,

                series: <ChartSeries>[
                  LineSeries<SalesData, double>(
                    color: Color.fromRGBO(147, 167, 254, 1),
                      dataSource: _chartData,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                     name: "Heart attack"
                     // dataLabelSettings: DataLabelSettings(isVisible: true),
                   //   enableTooltip: true
                  )
                ],
                plotAreaBackgroundColor: Color.fromRGBO(157, 206, 255, 0.5)
              ))),
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2017, 78),
      SalesData(2018, 77),
      SalesData(2019, 79),
      SalesData(2020, 75),
      SalesData(2022, 76),
      SalesData(2023, 79),
      SalesData(2024, 75),
      SalesData(2025, 78),
      SalesData(2026, 77),
      SalesData(2027, 74),






    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}