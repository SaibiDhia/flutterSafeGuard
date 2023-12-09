import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../const.dart';
import '../model/Catastrophe.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({Key? key}) : super(key: key);

  @override
  _RecentFilesState createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  late List<Catastrophe> catastrophes;
  late int _rowsPerPage;
  late int _sortColumnIndex;
  late bool _sortAscending;

  @override
  void initState() {
    super.initState();
    catastrophes = [];
    _rowsPerPage = 10;
    _sortColumnIndex = 0;
    _sortAscending = true;
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:9090/catastrophe/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print(data); // Print the response body
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
            child: PaginatedDataTable(
              header: const Text(''),
              rowsPerPage: _rowsPerPage,
              onRowsPerPageChanged: (newRowsPerPage) {
                setState(() {
                  _rowsPerPage = newRowsPerPage!;
                });
              },
              availableRowsPerPage: [10, 20, 30],
              sortAscending: _sortAscending,
              sortColumnIndex: _sortColumnIndex,
              columns: [
                DataColumn(
                  label: Text("Titre"),
                  onSort: (columnIndex, ascending) {
                    _sort<String>((c) => c.titre, columnIndex, ascending);
                  },
                ),
                DataColumn(
                  label: Text("Type"),
                  onSort: (columnIndex, ascending) {
                    _sort<String>((c) => c.type, columnIndex, ascending);
                  },
                ),
                DataColumn(
                  label: Text("Description"),
                  onSort: (columnIndex, ascending) {
                    _sort<String>((c) => c.description, columnIndex, ascending);
                  },
                ),
                DataColumn(
                  label: Text("Date"),
                  onSort: (columnIndex, ascending) {
                    _sort<DateTime>((c) => c.date, columnIndex, ascending);
                  },
                ),
                DataColumn(
                  label: Text("Magnitude"),
                  onSort: (columnIndex, ascending) {
                    _sort<double>((c) => c.magnitude, columnIndex, ascending);
                  },
                ),
                DataColumn(
                  label: Text("Supprimer"),
                ),
                DataColumn(
                  label: Text("Modifier"),
                ),
              ],
              source: _DataSource(context, catastrophes, _handleDelete),
            ),
          ),
        ],
      ),
    );
  }

  void _handleDelete(Catastrophe catastrophe) async {
    final response = await http.delete(
      Uri.parse('http://localhost:9090/catastrophe/${catastrophe.id}'),
    );

    if (response.statusCode == 204) {
      // Delete successful, update the UI or fetch data again
      setState(() {
        catastrophes.remove(catastrophe);
      });
    } else {
      // Delete failed, handle the error
      print('Failed to delete the catastrophe.');
    }
  }

  void _sort<T extends Comparable>(
    T Function(Catastrophe d) getField,
    int columnIndex,
    bool ascending,
  ) {
    catastrophes.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending ? aValue.compareTo(bValue) : bValue.compareTo(aValue);
    });

    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }
}

class _DataSource extends DataTableSource {
  final BuildContext context;
  final List<Catastrophe> catastrophes;
  final Function(Catastrophe) onDeletePressed;

  _DataSource(this.context, this.catastrophes, this.onDeletePressed);

  @override
  DataRow getRow(int index) {
    final catastrophe = catastrophes[index];
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
              onDeletePressed(catastrophe);
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

  @override
  int get rowCount => catastrophes.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
