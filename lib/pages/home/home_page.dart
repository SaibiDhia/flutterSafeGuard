// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:garduino_dashboard/pages/home/widgets/header_widget.dart';
import 'package:garduino_dashboard/responsive.dart';
import 'package:garduino_dashboard/pages/home/widgets/activity_details_card.dart';
import 'package:garduino_dashboard/pages/home/widgets/bar_graph_card.dart';
import 'package:garduino_dashboard/pages/home/widgets/line_chart_card.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/your_backgroun2.jpg"), // Replace with your image asset
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 15 : 18,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: Responsive.isMobile(context) ? 5 : 18,
                ),
                Header(scaffoldKey: scaffoldKey),
                /* _height(context),
                const ActivityDetailsCard(),*/
                _height(context),
                LineChartCard(),
                _height(context),
                BarGraphCard(),
                _height(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
