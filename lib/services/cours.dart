import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cours.dart';
import 'dart:io';
import '../services/CloudinaryService.dart';

class CoursService {
  Future<List<CoursProgramme>> getCours() async {
    final response = await http.get(Uri.parse('http://localhost:9090/cours/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => CoursProgramme.fromJson(item)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des cours');
    }
  }

  Future<void> deleteCours(String id) async {
    final response =
        await http.delete(Uri.parse('http://localhost:9090/cours/$id'));

    if (response.statusCode == 200) {
      print('Cours supprimé avec succès');
    } else {
      throw Exception('Erreur lors de la suppression du cours');
    }
  }

  Future<void> addCours(CoursProgramme coursProgramme) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:9090/cours/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'Type': coursProgramme
              .type, // Assurez-vous que le champ Type est correctement défini
          'description': coursProgramme.description,
        }),
      );

      if (response.statusCode == 200) {
        print('Cours ajouté avec succès');
      } else {
        print(
            'Erreur lors de l\'ajout du cours. Code : ${response.statusCode}');
        print('Réponse du serveur : ${response.body}');
      }
    } catch (error) {
      print('Erreur lors de l\'ajout du cours : $error');
    }
  }



Future<Map<String, int>> getStatistiqueNombreFavorisParTypeCours() async {
  final url = 'http://localhost:9090/favorie/stat';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
     
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      
      Map<String, int> statistiquesFinale = Map<String, int>.from(jsonResponse);
      return statistiquesFinale;
    } else {
      print('Erreur de requête : ${response.statusCode}');
      return Map<String, int>(); 
    }
  } catch (error) {

    print('Erreur lors de l\'envoi de la requête : $error');
    return Map<String, int>(); 
  }
}
}