import 'package:flutter/material.dart';
import '../../model/program.dart';
import '../../pages/program_row.dart';
import '../../services/program.dart';

class DashboardProgram extends StatefulWidget {
  @override
  _DashboardProgramState createState() => _DashboardProgramState();
}

class _DashboardProgramState extends State<DashboardProgram> {
  ProgramService programService = ProgramService();
  List<Program> programs = [];

  int nombreTotalPrograms = 0;

  Future<void> fetchPrograms() async {
    try {
      List<Program> fetchedPrograms = await programService.getPrograms();

      setState(() {
        programs = fetchedPrograms;
        // nombreTotalPrograms = programs.length;
      });
    } catch (error) {
      print('Erreur lors de la récupération des programmes: $error');
    }
  }

  Future<void> supprimerProgram(Program program) async {
    try {
      await programService.deleteProgram(program.titre);
      fetchPrograms(); // Refresh the livraisons list after deletion
    } catch (error) {
      print('Erreur lors de la suppression de la programme: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPrograms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord des programmes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ProgramTable(
              programs: programs,
              onDelete: supprimerProgram,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardProgram(),
  ));
}




/*
class DashboardProgramme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord'),
      ),
      body: FutureBuilder<List<Program>>(
        future: getProgrammes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            List<Program> programs = snapshot.data ?? [];
            return Stack(
              children: [
                ProgramTable(programs: programs),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 119, 47, 50),
                      ),
                      onPressed: () {
                        // Code pour ajouter un programme (à implémenter)
                      },
                      child: Text('Ajouter un programme'),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

*/

