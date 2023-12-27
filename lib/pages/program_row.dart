import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../widgets/program/cours_page.dart';
import '../model/program.dart';

class ProgramTable extends StatelessWidget {
  final List<Program> programs;
  final Function(Program) onDelete;
  final Function(Program, Program) onUpdate;

  ProgramTable({required this.programs, required this.onDelete, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: DataTable(
            columns: [
              DataColumn(label: Text('Image')),
              DataColumn(label: Text('Titre')),
              DataColumn(label: Text('Description du programme')),
              DataColumn(label: Center(child: Text('Actions'))),
              DataColumn(label: Center(child: Text(''))),
            ],
            rows: programs.map((program) {
              return DataRow(cells: [
                DataCell(
                  CachedNetworkImage(
                    imageUrl: program.image,
                    width: 70,
                    height: 70,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                DataCell(Text(program.titre)),
                DataCell(
                   
                  
                      ( Text(program.descriptionProgramme)),
                    
                  
                ),
                DataCell(
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _showUpdateDialog(context, program);
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
                          onDelete(program);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
                DataCell(
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DashboardCours()),
                        );
                      },
                      child: Text('Cours'),
                    ),
                  ),
                ),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, Program program) {
    String titre = program.titre;
    String description = program.descriptionProgramme;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mettre à jour le programme'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Titre'),
                controller: TextEditingController(text: titre),
                onChanged: (value) {
                  titre = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description du programme'),
                controller: TextEditingController(text: description),
                onChanged: (value) {
                  description = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                onUpdate(program, Program(
                  id: program.id,
                  titre: titre,
                  descriptionProgramme: description,
                  cours: program.cours,
                  image: program.image,
                ));
                Navigator.of(context).pop();
              },
              child: Text('Mettre à jour'),
            ),
          ],
        );
      },
    );
  }
}
