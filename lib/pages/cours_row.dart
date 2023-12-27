import 'package:flutter/material.dart';
import '../model/cours.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CoursProgrammeTable extends StatelessWidget {
  final List<CoursProgramme> cours;
  final Function(CoursProgramme) onDelete;

  CoursProgrammeTable({required this.cours, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: DataTable(
            dataRowHeight: 120.0, // Ajuster la hauteur de chaque ligne
            columnSpacing: 20.0, // Espacement entre les colonnes
            horizontalMargin: 20.0, // Marge horizontale

            columns: [
              DataColumn(label: Text('Image')),
              DataColumn(label: Text('Type')),
              DataColumn(label: Text('Description')),
              DataColumn(
                label: Center(child: Text('Actions')),
              ),
            ],
            rows: cours.map((cour) {
              return DataRow(cells: [
                DataCell(
                  CachedNetworkImage(
                    imageUrl: cour.image,
                    width: 100,
                    height: 100,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                DataCell(Text(cour.Type)),
                DataCell(
                  Container(
                    width: 700 ,
                    height: double.infinity,
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
      ),
    );
  }

  void _openCommentDrawer(BuildContext context, CoursProgramme cour) {
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
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                ListTile(
                  title: Text('Comment 1 for ${cour.Type}'),
                ),
                ListTile(
                  title: Text('Comment 2 for ${cour.Type}'),
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
