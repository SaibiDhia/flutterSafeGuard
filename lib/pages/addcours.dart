import 'package:flutter/material.dart';

class AddCoursPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Cours'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddCoursForm(),
      ),
    );
  }
}

class AddCoursForm extends StatefulWidget {
  @override
  _AddCoursFormState createState() => _AddCoursFormState();
}

class _AddCoursFormState extends State<AddCoursForm> {
  // Ajoutez les contrôleurs pour les champs du formulaire
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: typeController,
          decoration: InputDecoration(labelText: 'Type'),
        ),
        TextField(
          controller: descriptionController,
          decoration: InputDecoration(labelText: 'Description'),
        ),
        TextField(
          controller: imageController,
          decoration: InputDecoration(labelText: 'Image'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Ajoutez ici la logique pour ajouter le cours à la liste
            // en utilisant les valeurs des contrôleurs.
            // Assurez-vous de gérer la navigation ou de mettre à jour
            // l'état selon vos besoins.
          },
          child: Text('Ajouter le Cours'),
        ),
      ],
    );
  }
}
