import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';



class Graphing extends StatefulWidget {




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
      SalesData(5, 95),
      SalesData(5.1, 77),
      SalesData(5.2, 79),
      SalesData(5.3, 70),
      SalesData(5.4, 75),
      SalesData(5.5, 72),
      SalesData(5.6, 95),
      SalesData(5.6, 78),
      SalesData(5.8, 83),
      SalesData(5.9, 74),
      SalesData(6.0, 99),
      SalesData(7.1, 74),
      SalesData(7.2, 82),
      SalesData(7.3, 76),
      SalesData(7.4, 92),
      SalesData(7.5, 77),









    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}