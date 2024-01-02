/*import 'package:flutter/material.dart';
import 'package:garduino_dashboard/model/program.dart';
import 'package:garduino_dashboard/pages/program_row.dart';
import 'package:garduino_dashboard/services/program.dart';
import 'package:garduino_dashboard/widgets/program/addOrgramForm.dart';


class DashboardProgram extends StatefulWidget {
  @override
  _DashboardProgramState createState() => _DashboardProgramState();
}

class _DashboardProgramState extends State<DashboardProgram> {
  ProgramService programService = ProgramService();
  List<Program> programs = [];

  Future<void> fetchPrograms() async {
    try {
      List<Program> fetchedPrograms = await programService.getPrograms();

      setState(() {
        programs = fetchedPrograms;
      });
    } catch (error) {
      print('Erreur lors de la récupération des programmes: $error');
    }
  }

  Future<void> deleteProgram(Program program) async {
    try {
      await programService.deleteProgram(program.titre);
      fetchPrograms(); 
    } catch (error) {
      print('Erreur lors de la suppression du programme: $error');
    }
  }

  
   void addProgram(Program nouveauProgramme) async {
    try {
      await programService.addProgram(
        nouveauProgramme.titre,
        nouveauProgramme.descriptionProgramme,
        nouveauProgramme.cours,
        nouveauProgramme.image,

      );

      fetchPrograms(); 

      print('Nouveau PROGRAMME ajouté : ${nouveauProgramme.titre}');
    } catch (error) {
      print('Erreur lors de l\'ajout du cours : $error');
    }
  }

   void naviguerAjoutProgramme() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProgramForm(
         onAdd: addProgram,
        ),
      ),
    );
    fetchPrograms();
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: naviguerAjoutProgramme,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ProgramTable(
              programs: programs,
              onDelete: deleteProgram,
             
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
}*/
import 'package:flutter/material.dart';
import 'package:garduino_dashboard/model/program.dart';
import 'package:garduino_dashboard/pages/program_row.dart';
import 'package:garduino_dashboard/services/program.dart';
import 'package:garduino_dashboard/widgets/program/addOrgramForm.dart';
class DashboardProgram extends StatefulWidget {
  @override
  _DashboardProgramState createState() => _DashboardProgramState();
}

class _DashboardProgramState extends State<DashboardProgram> {
  ProgramService programService = ProgramService();
  List<Program> programs = [];

  void addProgram(Program newProgram) async {
    try {
      await programService.addProgram(
        newProgram.titre,
        newProgram.descriptionProgramme,
        newProgram.cours,
        newProgram.image,
      );

      fetchPrograms(); // Rafraîchir la liste après ajout
      print('Nouveau programme ajouté : ${newProgram.titre}');
    } catch (error) {
      print('Erreur lors de l\'ajout du programme : $error');
    }
  }

  void updateProgram(Program updatedProgram) async {
    try {
      await programService.updateProgram(
        updatedProgram.id,
        updatedProgram.titre,
        updatedProgram.descriptionProgramme,
        updatedProgram.cours,
        updatedProgram.image,
      );

      fetchPrograms(); // Rafraîchir la liste après mise à jour
      print('Programme mis à jour : ${updatedProgram.titre}');
    } catch (error) {
      print('Erreur lors de la mise à jour du programme : $error');
    }
  }

  void navigateToAddProgram() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProgramForm(
          onAdd: addProgram,
          onUpdate: updateProgram,
        ),
      ),
    );
    fetchPrograms(); // Rafraîchir la liste après retour
  }

  Future<void> fetchPrograms() async {
    try {
      List<Program> fetchedPrograms = await programService.getPrograms();

      setState(() {
        programs = fetchedPrograms;
      });
    } catch (error) {
      print('Erreur lors de la récupération des programmes: $error');
    }
  }

  Future<void> deleteProgram(Program program) async {
    try {
      await programService.deleteProgram(program.titre);
      fetchPrograms(); // Rafraîchir la liste après suppression
    } catch (error) {
      print('Erreur lors de la suppression du programme: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPrograms(); // Récupérer la liste des programmes au démarrage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord des programmes'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: navigateToAddProgram,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ProgramTable(
              programs: programs,
              onDelete: deleteProgram,
              onUpdate: updateProgram,
            ),
          ),
        ],
      ),
    );
  }
}






/*
import 'package:flutter/material.dart';
import 'package:garduino_dashboard/widgets/program/addOrgramForm.dart';
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProgramForm()),
              );
            },
          ),
        ],
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

*/


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