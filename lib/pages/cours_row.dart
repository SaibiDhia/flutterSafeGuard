import 'package:flutter/material.dart';
import '../model/cours.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CoursProgrammeTable extends StatefulWidget {
  final List<CoursProgramme> cours;
  final Function(CoursProgramme) onDelete;

  CoursProgrammeTable({required this.cours, required this.onDelete});

  @override
  _CoursProgrammeTableState createState() => _CoursProgrammeTableState();
}

class _CoursProgrammeTableState extends State<CoursProgrammeTable> {
  CoursProgramme? selectedCours;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Partie du tableau
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: DataTable(
                  dataRowHeight: 120.0,
                  columnSpacing: 20.0,
                  horizontalMargin: 20.0,
                  columns: [
                    DataColumn(label: Text('Image')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Description')),
                    DataColumn(
                      label: Center(child: Text('Actions')),
                    ),
                  ],
                  rows: widget.cours.map((cour) {
                    return DataRow(cells: [
                      DataCell(
                        CachedNetworkImage(
                          imageUrl: cour.image,
                          width: 100,
                          height: 100,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      DataCell(Text(cour.Type)),
                      DataCell(
                        Container(
                          width: 700,
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
                                widget.onDelete(cour);
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
                                setState(() {
                                  selectedCours = cour;
                                });
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
          ),
          // Partie des commentaires
          if (selectedCours != null)
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8.0),
              ),
             
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Comments for ${selectedCours!.Type}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            selectedCours = null;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    title: Text('Comment 1', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    title: Text('Comment 2', style: TextStyle(color: Colors.white)),
                  ),
                 
                ],
              ),
            ),
        ],
      ),
    );
  }
}
