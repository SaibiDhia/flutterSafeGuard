import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const dashboard_page());
}
class dashboard_page extends StatelessWidget {
  const dashboard_page({super.key});

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<FlSpot> dataPoints = [
    const FlSpot(0, 5),
    const FlSpot(1, 10),
    const FlSpot(2, 8),
    const FlSpot(3, 15),
    const FlSpot(4, 12),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-time Dashboard'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroun2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 1,
                    ),
                  ),
                  minX: 0,
                  maxX: 4,
                  minY: 0,
                  maxY: 20,
                  lineBarsData: [
                    LineChartBarData(
                      spots: dataPoints,
                      isCurved: true,
                      color: Colors.lightBlue[700],
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
