import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../const.dart';
import '../model/RecentFile.dart';
import '../model/Catastrophe.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({Key? key}) : super(key: key);

  @override
  _RecentFilesState createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  List<Catastrophe> catastrophes = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:9090/catastrophe/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        catastrophes = data.map((json) => Catastrophe.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              columns: [
                DataColumn(
                  label: Text("Titre"),
                ),
                DataColumn(
                  label: Text("Type"),
                ),
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
                catastrophes.length,
                (index) => catastropheDataRow(catastrophes[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow catastropheDataRow(Catastrophe catastrophe) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(catastrophe.titre),
            ),
          ],
        ),
      ),
      DataCell(Text(catastrophe.type)),
      DataCell(Text(catastrophe.description)),
      DataCell(Text(catastrophe.date.toLocal().toString())),
      DataCell(Text(catastrophe.magnitude.toString())),
      DataCell(
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // Handle delete button press
          },
        ),
      ),
      DataCell(
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Handle edit button press
          },
        ),
      ),
    ],
  );
}
