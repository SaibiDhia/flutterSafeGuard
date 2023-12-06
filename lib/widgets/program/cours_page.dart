import 'package:flutter/material.dart';
import '../../model/cours.dart'; // Assurez-vous d'importer le bon fichier de modèle
import '../../pages/cours_row.dart'; // Assurez-vous d'importer le bon fichier pour le tableau

class DashboardCours extends StatelessWidget {
  final List<CoursProgramme> coursList = [
    CoursProgramme(
      type: 'Introduction',
      description: 'Description de l\'introduction',
      image: 'image_intro.jpg',
    ),
    CoursProgramme(
      type: 'CAUSE',
      description: 'Description de la cause',
      image: 'image_cause.jpg',
    ),
    // Ajouter d'autres cours si nécessaire
  ];

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
                  primary: Color.fromARGB(255, 80, 57, 57),
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
}
