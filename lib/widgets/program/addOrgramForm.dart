import 'package:flutter/material.dart';

class AddProgramForm extends StatefulWidget {
  final Function(String, String, String, List<String>) onAdd;

  AddProgramForm({required this.onAdd});

  @override
  _AddProgramFormState createState() => _AddProgramFormState();
}

class _AddProgramFormState extends State<AddProgramForm> {
  TextEditingController _titreController = TextEditingController();
   TextEditingController _imageController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _coursController = TextEditingController();

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
            TextFormField(
              controller: _titreController,
              decoration: InputDecoration(labelText: 'Titre'),
            ),
             TextFormField(
                          controller: _imageController,
                          decoration: InputDecoration(labelText: 'Image'),
                        ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description du programme'),
            ),
            TextFormField(
              controller: _coursController,
              decoration: InputDecoration(labelText: 'Cours (séparés par des virgules)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String titre = _titreController.text;
                String image= _imageController.text;
                String description = _descriptionController.text;
                List<String> cours = _coursController.text.split(',');

                widget.onAdd(titre,image, description, cours);
                Navigator.pop(context); // Fermer le formulaire après l'ajout
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
