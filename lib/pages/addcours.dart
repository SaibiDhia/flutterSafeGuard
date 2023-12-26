import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/cours.dart';

class AddCours extends StatefulWidget {
  final Function(CoursProgramme) onAjouter;

  AddCours({required this.onAjouter});

  @override
  _AddCoursState createState() => _AddCoursState();
}

class _AddCoursState extends State<AddCours> {
  TextEditingController _Type = TextEditingController();
  TextEditingController _description = TextEditingController();
  String? _selectedImagePath;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un nouveau cours'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _Type,
              decoration: InputDecoration(labelText: 'Type'),
            ),
            TextFormField(
              controller: _description,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Sélectionner une image'),
            ),
            _selectedImagePath != null
                ? Text('Image URL: $_selectedImagePath')
                : Container(),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String Type = _Type.text;
                String description = _description.text;

                if (_selectedImagePath != null) {
                  CoursProgramme nouveauCoursProgramme = CoursProgramme(
                    id: '', // Provide the appropriate id value or leave it empty based on your application logic.
                    Type: Type,
                    description: description,
                    image: _selectedImagePath!,
                  );

                  widget.onAjouter(nouveauCoursProgramme);
                  Navigator.pop(context); // Close the add point page
                } else {
                  print('Veuillez sélectionner une image.');
                }
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
