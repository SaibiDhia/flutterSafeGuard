/*import 'package:flutter/material.dart';
import '../../model/cours.dart';
import '../../pages/cours_row.dart'; 

class DashboardCours extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord Cours'),
      ),
      body: Stack(
        children: [
          CoursProgrammeTable(coursList: coursList),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 86, 29, 29),
                ),
                onPressed: () {
                },
                child: Text('Ajouter un cours'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import '../../model/cours.dart';
import '../../pages/cours_row.dart';
import '../../services/cours.dart';

class DashboardCours extends StatefulWidget {
  @override
  _DashboardCoursState createState() => _DashboardCoursState();
}

class _DashboardCoursState extends State<DashboardCours> {
  CoursService coursService = CoursService();
  List<CoursProgramme> cours = [];



  Future<void> fetchCours() async {
    try {
      List<CoursProgramme> fetchedCours = await coursService.getCours();

      setState(() {
        cours = fetchedCours;
       
      });
    } catch (error) {
      print('Erreur lors de la récupération des cours : $error');
    }
  }

  Future<void> supprimerCours(CoursProgramme coursProgramme) async {
    try {
      await coursService.deleteCours(coursProgramme.id);
      fetchCours(); // Refresh the livraisons list after deletion
    } catch (error) {
      print('Erreur lors de la suppression de la cours: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCours();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord des cours'),
      ),
      body: Column(
        children: [
          Expanded(
            child:  CoursProgrammeTable (
              cours: cours,
              onDelete: supprimerCours,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardCours(),
  ));
}

