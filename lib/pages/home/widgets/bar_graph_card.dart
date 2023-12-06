import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:garduino_dashboard/responsive.dart';
import 'package:garduino_dashboard/model/bar_graph_model.dart';
import 'package:garduino_dashboard/model/graph_model.dart';
import 'package:garduino_dashboard/widgets/custom_card.dart';

class BarGraphCard extends StatelessWidget {
  BarGraphCard({super.key});

  final List<BarGraphModel> data = [
    BarGraphModel(
        lable: "Blog by disaster",
        color: const Color(0xFFFFFF),
        graph: [
          GraphModel(x: 0, y: 8),
          GraphModel(x: 1, y: 10),
          GraphModel(x: 2, y: 7),
        ]),

         
         
    BarGraphModel(
        lable: "Average Response Time",
        color: const Color(0xFFFFFF),
        graph: [
          GraphModel(x: 0, y: 8),
          GraphModel(x: 1, y: 10),
          GraphModel(x: 2, y: 9),
          GraphModel(x: 3, y: 7),
          GraphModel(x: 4, y: 6),
          GraphModel(x: 5, y: 5),
        ]),
    BarGraphModel(
        lable: "Number of Active Users",
        color: const Color(0x80FFFFFF),
        graph: [
          GraphModel(x: 0, y: 7),
          GraphModel(x: 1, y: 10),
          GraphModel(x: 2, y: 7),
        ]),

  ];

  final lable = ['1', '2', '3', '4', '5', '6'];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0,
          childAspectRatio: Responsive.isMobile(context) ? 16 / 9 : 5 / 4),
      itemBuilder: (context, i) {
        return CustomCard(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[i].lable,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: BarChart(
                    BarChartData(
                      barGroups: _chartGroups(
                          points: data[i].graph, color: data[i].color),
                      borderData: FlBorderData(border: const Border()),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                lable[value.toInt()],
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                        )),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  List<BarChartGroupData> _chartGroups(
      {required List<GraphModel> points, required Color color}) {
    return points
        .map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [
              BarChartRodData(
                toY: point.y,
                width: 12,
                color: color.withOpacity(point.y.toInt() > 4 ? 1 : 0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0),
                ),
              )
            ]))
        .toList();
  }
}
