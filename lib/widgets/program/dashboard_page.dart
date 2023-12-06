import 'package:flutter/material.dart';
import '../../model/program.dart';
import '../../pages/program_row.dart';

class DashboardProgramme extends StatelessWidget {
  final List<Program> programs = [
    Program(
      title: 'Programme 1',
      description: 'Description du programme 1',
      image: 'image1.jpg',
    ),
    Program(
      title: 'Programme 2',
      description: 'Description du programme 2',
      image: 'image2.jpg',
    ),
    // Ajouter d'autres programmes si nécessaire
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord'),
      ),
      body: Stack(
        children: [
          ProgramTable(programs: programs),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  // Action à effectuer lors de l'ajout d'un nouveau programme
                  // (vous pouvez afficher une boîte de dialogue, une nouvelle page, etc.)
                },
                child: Text('Add Program'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}