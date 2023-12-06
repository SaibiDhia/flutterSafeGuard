import 'package:flutter/material.dart';
import '../model/cours.dart';

class CoursProgrammeTable extends StatefulWidget {
  final List<CoursProgramme> coursList;

  const CoursProgrammeTable({required this.coursList});

  @override
  _CoursProgrammeTableState createState() => _CoursProgrammeTableState();
}

class _CoursProgrammeTableState extends State<CoursProgrammeTable> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DataTable(
          columnSpacing: 15.0,
          columns: <DataColumn>[
            DataColumn(
              label: Container(
                width: 100,
                child: Center(child: Text('Type')),
              ),
            ),
            DataColumn(
              label: Container(
                width: 200,
                child: Center(child: Text('Description')),
              ),
            ),
            DataColumn(
              label: Container(
                width: 100,
                child: Center(child: Text('Image')),
              ),
            ),
            DataColumn(
              label: Center(child: Text('Actions')),
            ),
          ],
          rows: widget.coursList.map((cours) {
            return DataRow(
              cells: <DataCell>[
                DataCell(
                  Container(
                    width: 100,
                    child: Center(child: Text(cours.type)),
                  ),
                ),
                DataCell(
                  Container(
                    width: 200,
                    child: Center(child: Text(cours.description)),
                  ),
                ),
                DataCell(
                  Container(
                    width: 100,
                    child: Center(child: Text(cours.image)),
                  ),
                ),
                DataCell(
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _showModificationDialog(context, cours);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.edit, color: Colors.blue),
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 1,
                        color: Colors.black,
                      ),
                      InkWell(
                        onTap: () {
                          _showDeleteConfirmationDialog(context, cours);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 1,
                        color: Colors.black,
                      ),
                      InkWell(
                        onTap: () {
                          _showFeedbackList(context, cours);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.comment, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, CoursProgramme cours) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Êtes-vous sûr de vouloir supprimer ce cours ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Non'),
            ),
            TextButton(
              onPressed: () {
                _deleteCours(cours);
                Navigator.of(context).pop();
              },
              child: Text('Oui'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showFeedbackList(BuildContext context, CoursProgramme cours) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Les avis concernant ${cours.type}'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                ListTile(
                  title: Text('Une lecture instructive et stimulante. Merci pour ces insights'),
                ),
                ListTile(
                  title: Text('C\'est un régal intellectuel !'),
                ),
                // ...
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  void _deleteCours(CoursProgramme cours) {
    setState(() {
      widget.coursList.remove(cours);
    });
  }

  Future<void> _showModificationDialog(BuildContext context, CoursProgramme cours) async {
    
  }
}
