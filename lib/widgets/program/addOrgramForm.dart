import 'package:flutter/material.dart';

class AddProgramForm extends StatefulWidget {
  final Function(String, String, List<String>) onAdd;

  AddProgramForm({required this.onAdd});

  @override
  _AddProgramFormState createState() => _AddProgramFormState();
}

class _AddProgramFormState extends State<AddProgramForm> {
  TextEditingController titreController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController coursController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un programme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titreController,
              decoration: InputDecoration(labelText: 'Titre'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration:
                  InputDecoration(labelText: 'Description du programme'),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            TextField(
              controller: coursController,
              decoration: InputDecoration(
                  labelText: 'Cours (séparés par des virgules)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Appel à la fonction onAdd pour ajouter le programme
                String titre = titreController.text;
                String description = descriptionController.text;
                List<String> cours = coursController.text
                    .split(',')
                    .map((course) => course.trim())
                    .toList();

                widget.onAdd(titre, description, cours);

                // Après l'ajout, vous pouvez naviguer en arrière
                Navigator.pop(context);
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
