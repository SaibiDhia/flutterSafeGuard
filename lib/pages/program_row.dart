// widgets/program_row.dart
import 'package:flutter/material.dart';
import '../model/program.dart';


class ProgramTable extends StatelessWidget {
 
  final List<Program> programs;
  final Function(Program) onDelete ;
  

  ProgramTable({required this.programs , required this.onDelete});

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
            DataColumn(label: Text('Titre')),
            DataColumn(label: Text('Description du programme')),
            DataColumn(
              label: Center(child: Text('Actions')),
            ),
          ],
          rows: programs.map((program) {
            return DataRow(cells: [
             // DataCell(Text(program.id)),
             DataCell(Text(program.image)),
              DataCell(Text(program.titre)),
              DataCell(Container(
                    width: 250,
                    child: Center(child: Text(program.descriptionProgramme)),
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
                        onDelete(program);
                        
                        
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.delete, color: Colors.red),
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









/*
class ProgramTable extends StatefulWidget {
  final List<Program> programs;

  const ProgramTable({required this.programs});

  @override
  ProgramTableState createState() => ProgramTableState();
}

class ProgramTableState extends State<ProgramTable> {
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
                child: Center(child: Text('Titre')),
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
          rows: widget.programs.map((program) {
            return DataRow(
              cells: <DataCell>[
                
                DataCell(
                  Container(
                    width: 100,
                    child: Center(child: Text(program.titre)),
                  ),
                ),
                DataCell(
                  Container(
                    width: 200,
                    child: Center(child: Text(program.descriptionProgramme)),
                  ),
                ),
                /*DataCell(
                  Container(
                    width: 100,
                    child: Center(child: Text(program.image)),
                  ),
                ),*/
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
                        showDeleteConfirmationDialog(context, program);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  ],
                )),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> showDeleteConfirmationDialog(
      BuildContext context, Program program) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Êtes-vous sûr de vouloir supprimer le programme ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Non'),
            ),
            TextButton(
              onPressed: () {
                deleteProgram(program);
                Navigator.of(context).pop();
              },
              child: Text('Oui'),
            ),
          ],
        );
      },
    );
  }
  void deleteProgram(Program program) {
    setState(() {
      widget.programs.remove(program);
    });
  }
}
*/