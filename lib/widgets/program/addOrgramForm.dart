import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../model/program.dart';
class AddProgramForm extends StatefulWidget {
  
  final Function(Program) onAdd;

  AddProgramForm({required this.onAdd});

  @override
  _AddProgramState createState() => _AddProgramState();
}

class _AddProgramState extends State<AddProgramForm> {
  TextEditingController _Titre = TextEditingController();
  TextEditingController _description = TextEditingController();
   TextEditingController _cours = TextEditingController();
  String? _selectedImagePath;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
   print(pickedFile);
      setState(() {
        _selectedImagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un nouveau programme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _Titre,
              decoration: InputDecoration(labelText: 'Titre'),
            ),
            TextFormField(
              controller: _description,
              decoration: InputDecoration(labelText: 'Description'),
            ),
             TextFormField(
              controller: _cours,
              decoration: InputDecoration(labelText: 'Cours (séparés par des virgules)'),
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
                String titre = _Titre.text;
                String description = _description.text;
                List<String> cours = _cours.text.split(',');

                if (_selectedImagePath != null) {
                  Program nouveauProgramme = Program(
                    id: '', 
                    titre: titre,
                    descriptionProgramme: description,
                    cours: cours,
                    image: _selectedImagePath!,
                  );

                  widget.onAdd(nouveauProgramme);
                  Navigator.pop(context); 
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


