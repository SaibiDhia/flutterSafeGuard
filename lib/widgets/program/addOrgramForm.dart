import 'package:flutter/material.dart';

class AddProgramForm extends StatefulWidget {
  final Function(String, String, List<String>) onAdd;
  final TextEditingController titreController;
  final TextEditingController descriptionController;
  final TextEditingController coursController;

  AddProgramForm({
    required this.onAdd,
    required this.titreController,
    required this.descriptionController,
    required this.coursController,
  });

  @override
  _AddProgramFormState createState() => _AddProgramFormState();
}

class _AddProgramFormState extends State<AddProgramForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter/Modifier un programme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: widget.titreController,
              decoration: InputDecoration(labelText: 'Titre'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: widget.descriptionController,
              decoration: InputDecoration(labelText: 'Description du programme'),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            TextField(
              controller: widget.coursController,
              decoration: InputDecoration(labelText: 'Cours (séparés par des virgules)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Appel à la fonction onAdd pour ajouter ou modifier le programme
                String titre = widget.titreController.text;
                String description = widget.descriptionController.text;
                List<String> cours = widget.coursController.text
                    .split(',')
                    .map((course) => course.trim())
                    .toList();

                widget.onAdd(titre, description, cours);

                // Après l'ajout ou la modification, vous pouvez naviguer en arrière
                Navigator.pop(context);
              },
              child: Text('Ajouter/Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}

