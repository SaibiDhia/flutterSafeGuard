import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:garduino_dashboard/responsive.dart';
import 'package:garduino_dashboard/services/cours.dart';
import 'package:http/http.dart' as http;
import 'package:garduino_dashboard/widgets/custom_card.dart';
/*
class BarGraphCard extends StatefulWidget {
  BarGraphCard({Key? key}) : super(key: key);

  @override
  _BarGraphCardState createState() => _BarGraphCardState();
}

class _BarGraphCardState extends State<BarGraphCard> {
  final CoursService coursService = CoursService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, int>?>(
      future: coursService.getStatistiqueNombreFavorisParTypeCours(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Erreur: ${snapshot.error}'),
          );
        } else {
          final data = snapshot.data ?? {};
          return _buildGraph(data);
        }
      },
    );
  }

  Widget _buildGraph(Map<String, int> data) {
    return GridView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
        crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
        mainAxisSpacing: 12.0,
        childAspectRatio: Responsive.isMobile(context) ? 16 / 9 : 5 / 4,
      ),
      itemBuilder: (context, i) {
        final typesCours = data.keys.toList();
        final favorisCounts = data.values.toList();

        return CustomCard(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Favoris par Cours',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  typesCours[i],
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: BarChart(
                  BarChartData(
                    barGroups: _chartGroups(
                      points: favorisCounts,
                      color: const Color.fromARGB(255, 233, 0, 144),
                    ),
                    borderData: FlBorderData(border: const Border()),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          //getTitles: (value) => typesCours[value.toInt()],
                        ),
                      ),
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<BarChartGroupData> _chartGroups({required List<int> points, required Color color}) {
    return points
        .map(
          (point) => BarChartGroupData(
            x: points.indexOf(point),
            barRods: [
              BarChartRodData(
                toY: point.toDouble(),
                width: 12,
                color: color.withOpacity(point > 4 ? 1 : 0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
*/


class BarGraphCard extends StatefulWidget {
  BarGraphCard({Key? key}) : super(key: key);

  @override
  _BarGraphCardState createState() => _BarGraphCardState();
}

class _BarGraphCardState extends State<BarGraphCard> {
  final CoursService coursService = CoursService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, int>?>(
      future: coursService.getStatistiqueNombreFavorisParTypeCours(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Erreur: ${snapshot.error}'),
          );
        } else {
          final data = snapshot.data ?? {};
          return _buildGraph(data);
        }
      },
    );
  }

  Widget _buildGraph(Map<String, int> data) {
    final typesCours = data.keys.toList();
    final favorisCounts = data.values.toList();

    return CustomCard(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Favoris par Cours',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 300, // Ajustez la hauteur en fonction de vos besoins
            child: BarChart(
              BarChartData(
                barGroups: _chartGroups(
                  points: favorisCounts,
                  color: const Color.fromARGB(255, 233, 0, 144),
                ),
                borderData: FlBorderData(border: const Border()),
                gridData: FlGridData(show: false),
                /*titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    showTitles: true,
                    getTitles: (value) => typesCours[value.toInt()],
                  ),
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),*/
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _chartGroups({required List<int> points, required Color color}) {
    return points
        .map(
          (point) => BarChartGroupData(
            x: points.indexOf(point),
            barRods: [
              BarChartRodData(
                toY: point.toDouble(),
                width: 12,
                color: color.withOpacity(point > 4 ? 1 : 0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}

