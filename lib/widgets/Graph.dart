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
      decoration: BoxDecoration(
        color:  Color.fromRGBO(143, 163, 253, 1),
        borderRadius: BorderRadius.circular(40)
      ),
      margin: EdgeInsets.fromLTRB(0, 16, 0, 20),
      alignment: Alignment.topLeft,
      child: Stack(
        children:[
          SafeArea(
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
                       name: "Heart attack",
                      //  dataLabelSettings: DataLabelSettings(isVisible: true).,
                       enableTooltip: true
                    )
                  ],
                  plotAreaBackgroundColor: Color.fromRGBO(157, 206, 255, 0.5),
                  primaryXAxis: NumericAxis(
                    isVisible:false,
                  ),
                  primaryYAxis: NumericAxis(
                    isVisible:false,
                  ),
                ))),
          Positioned(
            top:20,
              left: 50,
              child: Text("Heart rate",style: TextStyle(//styleName: Text / Small Text (Medium);
                  fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              ),
              )
          ),
          Positioned(
            top: 40,
              left: 60,
              child: Text("78",style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            fontFamily: "Poppins",
            color: Color.fromRGBO(146, 163, 253, 1)
          ),)),
        ]
      ),
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(5, 78),
      SalesData(5.1, 77),
      SalesData(5.2, 79),
      SalesData(5.3, 75),
      SalesData(5.4, 76),
      SalesData(5.5, 79),
      SalesData(5.6, 75),
      SalesData(5.6, 78),
      SalesData(5.8, 77),
      SalesData(5.9, 74),
      SalesData(6.0, 100),
      SalesData(7.0, 120),








    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}