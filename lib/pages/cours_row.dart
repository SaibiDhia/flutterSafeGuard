import 'package:flutter/material.dart';
import '../model/cours.dart';

/*

class CoursProgrammeTable extends StatefulWidget {
  final List<CoursProgramme> coursList;

  const CoursProgrammeTable({required this.coursList});

  @override
  CoursProgrammeTableState createState() => CoursProgrammeTableState();
}

class CoursProgrammeTableState extends State<CoursProgrammeTable> {
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
                          showModificationDialog(context, cours);
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
                          showDeleteConfirmationDialog(context, cours);
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
                          showFeedbackList(context, cours);
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

  Future<void> showDeleteConfirmationDialog(
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
                deleteCours(cours);
                Navigator.of(context).pop();
              },
              child: Text('Oui'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showFeedbackList(BuildContext context, CoursProgramme cours) async {
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

  void deleteCours(CoursProgramme cours) {
    setState(() {
      widget.coursList.remove(cours);
    });
  }

  Future<void> showModificationDialog(BuildContext context, CoursProgramme cours) async {
    
  }
}*/

/*
class CoursProgrammeTable extends StatelessWidget {
 
  final List<CoursProgramme> cours;
  final Function(CoursProgramme) onDelete ;
  

  CoursProgrammeTable({required this.cours , required this.onDelete });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: DataTable(
          columns: [
           
           DataColumn(label: Text('Image')),
            DataColumn(label: Text('Type')),
            DataColumn(label: Text('Description ')),
            DataColumn(
              label: Center(child: Text('Actions')),
            ),
          ],
          rows: cours.map((cour) {
            return DataRow(cells: [
             // DataCell(Text(program.id)),
             DataCell(Text(cour.image)),
              DataCell(Text(cour.type)),
              DataCell(Container(
                    width: 250,
                    child: Center(child: Text(cour.description)),
                  )),
                DataCell(Row(
                  children: [
                    InkWell(
                      onTap: () {
        
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
                        onDelete(cour);
                        
                        
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
                         
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.comment, color: Colors.green),
                        ),
                      ),
                  ],
                )),
            
              
             // DataCell(Text(program.cours.join(', '))), // Join courses into a comma-separated string
            ]);
          }).toList(),
        ),
      ),
    );
  }
  
  
}
*/


class CoursProgrammeTable extends StatelessWidget {
  final List<CoursProgramme> cours;
  final Function(CoursProgramme) onDelete;

  CoursProgrammeTable({required this.cours, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: DataTable(
          columns: [
            DataColumn(label: Text('Image')),
            DataColumn(label: Text('Type')),
            DataColumn(label: Text('Description ')),
            DataColumn(
              label: Center(child: Text('Actions')),
            ),
          ],
          rows: cours.map((cour) {
            return DataRow(cells: [
              DataCell(Text(cour.image)),
              DataCell(Text(cour.type)),
              DataCell(
                Container(
                  width: 250,
                  child: Center(child: Text(cour.description)),
                ),
              ),
              DataCell(
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Action when edit icon is tapped
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
                        onDelete(cour);
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
                        // Open the drawer when comment icon is tapped
                        _openCommentDrawer(context, cour);
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
            ]);
          }).toList(),
        ),
      ),
    );
  }

  void _openCommentDrawer(BuildContext context, CoursProgramme cour) {
    // Open a Drawer with a list of comments and a close button
    Scaffold.of(context).openEndDrawer();
    Navigator.of(context).push(DrawerRoute(
        builder: (BuildContext context) {
          return Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  title: Text('Comments'),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context); // Close the drawer
                      },
                    ),
                  ],
                ),
                // Add your comment list here, for example:
                ListTile(
                  title: Text('Comment 1 for ${cour.type}'),
                ),
                ListTile(
                  title: Text('Comment 2 for ${cour.type}'),
                ),
              ],
            ),
          );
        },
        settings: RouteSettings(name: 'drawer')));
  }
}
class DrawerRoute extends MaterialPageRoute {
  DrawerRoute({required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);
}