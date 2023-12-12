/*import 'package:flutter/material.dart';

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
          },
          child: Text('Ajouter le Cours'),
        ),
      ],
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  
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
        
      ElevatedButton(
          onPressed: () {
            // Add your logic to handle the form submission
          },
          child: Text('Ajouter le Cours'),
        ),
      ],
    );
  }
}
*/
import 'package:flutter/material.dart';
import '../../model/cours.dart';

class AjoutCours extends StatefulWidget {
  final Function(CoursProgramme) onAjouter;

  AjoutCours({required this.onAjouter});

  @override
  _AjoutCoursProgrammeState createState() => _AjoutCoursProgrammeState();
}

class _AjoutCoursProgrammeState extends State<AjoutCours> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _type = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un nouveau cours'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _type,
                decoration: InputDecoration(labelText: 'Nom du Cours'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du Cours';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _description,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la description du Cours';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    CoursProgramme nouveauCoursProgramme = CoursProgramme(
                      id: '', // Provide the appropriate id value or leave it empty based on your application logic.
                      type: _type.text,
                      description: _description.text,
                    );

                    widget.onAjouter(nouveauCoursProgramme);
                    Navigator.pop(context); // Close the add point page
                  }
                },
                child: Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
