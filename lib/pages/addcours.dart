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
*/ /*
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
  final TextEditingController imageController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageController.text = pickedFile.path;
      });
    }
  }

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
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: imageController,
                decoration: InputDecoration(labelText: 'Image'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.image),
              onPressed: _pickImage,
            ),
          ],
        ),
        SizedBox(height: 20),
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
import 'dart:io';
import 'package:flutter/material.dart';
import '../services/cours.dart'; // Assurez-vous d'importer votre service de cours
import 'package:image_picker/image_picker.dart';

class AddCoursPage extends StatelessWidget {
  final CoursService coursService = CoursService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Cours'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddCoursForm(coursService: coursService),
      ),
    );
  }
}

class AddCoursForm extends StatefulWidget {
  final CoursService coursService;

  AddCoursForm({required this.coursService});

  @override
  _AddCoursFormState createState() => _AddCoursFormState();
}

class _AddCoursFormState extends State<AddCoursForm> {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageController.text = pickedFile.path;
      });
    }
  }

  void _addCours() async {
    await widget.coursService.addCoursProgramme(
      type: typeController.text,
      description: descriptionController.text,
      image: File(imageController.text),
    );
  }

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
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: imageController,
                decoration: InputDecoration(labelText: 'Image'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.image),
              onPressed: _pickImage,
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _addCours,
          child: Text('Ajouter le Cours'),
        ),
      ],
    );
  }
}
