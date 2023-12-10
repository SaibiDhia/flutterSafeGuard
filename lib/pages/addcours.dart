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
