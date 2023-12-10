/*import 'package:flutter/material.dart';
import '../../model/cours.dart';
import '../../pages/cours_row.dart'; 

class DashboardCours extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord Cours'),
      ),
      body: Stack(
        children: [
          CoursProgrammeTable(coursList: coursList),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 86, 29, 29),
                ),
                onPressed: () {
                },
                child: Text('Ajouter un cours'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import '../../model/cours.dart';
import '../../pages/cours_row.dart';
import '../../services/cours.dart';
import '../../pages/addcours.dart'; 

class DashboardCours extends StatefulWidget {
  @override
  _DashboardCoursState createState() => _DashboardCoursState();
}

class _DashboardCoursState extends State<DashboardCours> {
  CoursService coursService = CoursService();
  List<CoursProgramme> cours = [];

  Future<void> fetchCours() async {
    try {
      List<CoursProgramme> fetchedCours = await coursService.getCours();

      setState(() {
        cours = fetchedCours;
      });
    } catch (error) {
      print('Erreur lors de la récupération des cours : $error');
    }
  }

  Future<void> supprimerCours(CoursProgramme coursProgramme) async {
    try {
      await coursService.deleteCours(coursProgramme.id);
      fetchCours(); // Rafraîchir la liste des cours après la suppression
    } catch (error) {
      print('Erreur lors de la suppression de la cours: $error');
    }
  }

  void naviguerAjoutCours() {
    // Naviguer vers la page d'ajout de cours
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCoursPage()),
    ).then((value) {
      // Rafraîchir la liste des cours après l'ajout
      if (value != null && value) {
        fetchCours();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCours();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord des cours'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: naviguerAjoutCours,
            child: Text('Ajouter un cours'),
          ),
          Expanded(
            child: CoursProgrammeTable(
              cours: cours,
              onDelete: supprimerCours,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardCours(),
  ));
}

/*
import 'package:flutter/material.dart';
import 'package:admin/models/PointCollecte.dart';
import 'package:file_picker/file_picker.dart';

class AjoutPointCollecte extends StatefulWidget {
  final Function(PointCollecte) onAjouter;

  AjoutPointCollecte({required this.onAjouter});

  @override
  _AjoutPointCollecteState createState() => _AjoutPointCollecteState();
}

class _AjoutPointCollecteState extends State<AjoutPointCollecte> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nomPcController = TextEditingController();
  TextEditingController _addressMailPcController = TextEditingController();
  TextEditingController _addressPcController = TextEditingController();
  TextEditingController _numerotelController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _xController = TextEditingController();
  TextEditingController _yController = TextEditingController();

  Future<String> obtenirCheminFichier() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      return result.files.first.path ?? '';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Point de Collecte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomPcController,
                decoration: InputDecoration(labelText: 'Nom du Point de Collecte'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du Point de Collecte';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressMailPcController,
                decoration: InputDecoration(labelText: 'Adresse Email'),
                validator: (value) {
                  // Ajoutez des validations selon vos besoins
                  return null;
                },
              ),
              TextFormField(
                controller: _addressPcController,
                decoration: InputDecoration(labelText: 'Adresse'),
                validator: (value) {
                  // Ajoutez des validations selon vos besoins
                  return null;
                },
              ),
              TextFormField(
                controller: _numerotelController,
                decoration: InputDecoration(labelText: 'Numéro de Téléphone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  // Ajoutez des validations selon vos besoins
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  String cheminImage = await obtenirCheminFichier();
                  setState(() {
                    _imageController.text = cheminImage;
                  });
                },
                child: Text('Sélectionner une image'),
              ),
              TextFormField(
                controller: _xController,
                decoration: InputDecoration(labelText: 'Coordonnée X'),
                validator: (value) {
                  // Ajoutez des validations selon vos besoins
                  return null;
                },
              ),
              TextFormField(
                controller: _yController,
                decoration: InputDecoration(labelText: 'Coordonnée Y'),
                validator: (value) {
                  // Ajoutez des validations selon vos besoins
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    PointCollecte nouveauPointCollecte = PointCollecte(
                      id: 'your_id_here', // Fournissez un ID correct ou générez-en un
                      nomPc: _nomPcController.text,
                      addressMailPc: _addressMailPcController.text,
                      addressPc: _addressPcController.text,
                      numerotel: int.parse(_numerotelController.text),
                      image: _imageController.text,
                      x: double.parse(_xController.text),
                      y: double.parse(_yController.text),
                    );

                    widget.onAjouter(nouveauPointCollecte);
                    Navigator.pop(context); // Ferme la page d'ajout
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
*/