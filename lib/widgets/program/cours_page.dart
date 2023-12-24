/*import 'package:flutter/material.dart';
import '../../model/cours.dart';
import '../../pages/cours_row.dart';
import '../../services/cours.dart';
import '../../pages/addcours.dart'; 

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
      fetchCours(); // Rafraîchir la liste des cours après la suppression
    } catch (error) {
      print('Erreur lors de la suppression de la cours: $error');
    }
  }
  void ajouterCoursProgramme(CoursProgramme nouveauCoursProgramme) async {
    try {
      CoursProgramme coursCree=
          await coursService.createCoursProgramme( nouveauCoursProgramme);

    // int totalPoints = await  nouveauCoursProgramme.countTotalPoints();

     /* setState(() {
       CoursProgramme.add(coursCree);
        nombreTotalPointCollecte = totalPoints; // Mettez à jour le total
      });*/

      print('Nouveau Point de collecte ajouté : ${nouveauCoursProgramme.type}');
    } catch (error) {
      print('Erreur lors de l\'ajout du point de collecte : $error');
    }
  }

  /*void naviguerAjoutCours() {
    // Naviguer vers la page d'ajout de cours
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  AjoutCours()),
    ).then((value) {
      // Rafraîchir la liste des cours après l'ajout
      if (value != null && value) {
        fetchCours();
      }
    });
  }
*/
void naviguerAjoutCours() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AjoutCours (
          onAjouter: ajouterCoursProgramme ,
        ),
      ),
    );


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
          ElevatedButton(
            onPressed: naviguerAjoutCours,
            child: Text('Ajouter un cours'),
          ),
          Expanded(
            child: CoursProgrammeTable(
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
}
*/
/*
import 'package:flutter/material.dart';
import '../../model/cours.dart';
import '../../pages/cours_row.dart';
import '../../services/cours.dart';
import '../../pages/addcours.dart';

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
      await coursService.deleteCours(coursProgramme.id!);
      fetchCours(); // Rafraîchir la liste des cours après la suppression
    } catch (error) {
      print('Erreur lors de la suppression de la cours: $error');
    }
  }
/*
  Future<void> ajouterCours(CoursProgramme nouveauCoursProgramme) async {
    try {
      await coursService.addCours(nouveauCoursProgramme);
      fetchCours(); // Rafraîchir la liste des cours après l'ajout
    } catch (error) {
      print('Erreur lors de l\'ajout du cours: $error');
    }
  }
  */
   void ajouterCours(CoursProgramme nouveauCoursProgramme) async {
    try {
      await coursService.addCours(
        nouveauCoursProgramme.Type,
        nouveauCoursProgramme.description,
        nouveauCoursProgramme.image,
      );

      fetchCours(); // Rafraîchir la liste des cours après l'ajout

      print('Nouveau cours ajouté : ${nouveauCoursProgramme.Type}');
    } catch (error) {
      print('Erreur lors de l\'ajout du cours : $error');
    }
  }

  void naviguerAjoutCours() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCours(
         onAjouter: ajouterCours,
        ),
      ),
    );

    // Rafraîchir la liste des cours après l'ajout
    fetchCours();
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
          ElevatedButton(
            onPressed: naviguerAjoutCours,
            child: Text('Ajouter un cours'),
          ),
          Expanded(
            child: CoursProgrammeTable(
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
*/
import 'package:flutter/material.dart';
import '../../model/cours.dart';
import '../../services/cours.dart';
import '../../pages/cours_row.dart';
import '../../pages/addcours.dart';

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
      await coursService.deleteCours(coursProgramme.id!);
      fetchCours(); // Rafraîchir la liste des cours après la suppression
    } catch (error) {
      print('Erreur lors de la suppression du cours: $error');
    }
  }

  void ajouterCours(CoursProgramme nouveauCoursProgramme) async {
    try {
      await coursService.ajouterCours(
        nouveauCoursProgramme.Type,
        nouveauCoursProgramme.description,
        nouveauCoursProgramme.image,
      );

      fetchCours(); // Rafraîchir la liste des cours après l'ajout

      print('Nouveau cours ajouté : ${nouveauCoursProgramme.Type}');
    } catch (error) {
      print('Erreur lors de l\'ajout du cours : $error');
    }
  }

  void naviguerAjoutCours() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCours(
          onAjouter: ajouterCours,
        ),
      ),
    );

    // Rafraîchir la liste des cours après l'ajout
    fetchCours();
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
          ElevatedButton(
            onPressed: naviguerAjoutCours,
            child: Text('Ajouter un cours'),
          ),
          Expanded(
            child: CoursProgrammeTable(
              cours: cours,
              onDelete: supprimerCours,
            ),
          ),
        ],
      ),
    );
  }
}