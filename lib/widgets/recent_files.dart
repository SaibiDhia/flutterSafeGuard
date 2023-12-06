import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garduino_dashboard/model/RecentFile.dart';
import 'package:garduino_dashboard/pages/home/widgets/line_chart_card.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF2A2D3E),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Liste des catastrophes",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: 16,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("Description"),
                  ),
                  DataColumn(
                    label: Text("Date"),
                  ),
                  DataColumn(
                    label: Text("Magnitude"),
                  ),
                  DataColumn(
                    label: Text("Supprimer"),
                  ),
                  DataColumn(
                    label: Text("Modifier"),
                  ),
                ],
                rows: List.generate(
                  demoRecentFiles.length,
                  (index) => recentFileDataRow(demoRecentFiles[index]),
                ),
              ),
            ),
            LineChartCard()
          ],
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
      DataCell(
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            print('Delete button pressed for file ${fileInfo.title}');
          },
        ),
      ),
      DataCell(
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            print('Edit button pressed for file ${fileInfo.title}');
          },
        ),
      ),
    ],
  );
}
