import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/program.dart';

class ProgramService {
  Future<List<Program>> getPrograms() async {
    final response =
        await http.get(Uri.parse('http://localhost:9090/programme/cours'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Program.fromJson(item)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des programmes');
    }
  }

  Future<void> deleteProgram(String titre) async {
    final response =
        await http.delete(Uri.parse('http://localhost:9090/programme/$titre'));

    if (response.statusCode == 200) {
      print('Programme supprimé avec succès');
    } else {
      throw Exception('Erreur lors de la suppression du programme');
    }
  }

  Future<void> addProgram(Program program) async {
    final response = await http.post(
      Uri.parse('http://localhost:9090/programme/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(program.toJson()),
    );

    if (response.statusCode == 200) {
      print('Programme ajouté avec succès');
    } else {
      throw Exception('Erreur lors de l\'ajout du programme');
    }
  }
  Future<void> updateProgram(String id, Program updatedProgram) async {
    final response = await http.put(
      Uri.parse('http://localhost:9090/programme/$id'), // Utilisez l'ID ici
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(updatedProgram.toJson()),
    );

    if (response.statusCode == 200) {
      print('Programme mis à jour avec succès');
    } else {
      throw Exception('Erreur lors de la mise à jour du programme');
    }
  }
  Future<List<Map<String, dynamic>>> fetchStatistiques() async {
  final response = await http.get(Uri.parse('http://localhost:9090/programme/stat'));

  if (response.statusCode == 200) {
    return List<Map<String, dynamic>>.from(json.decode(response.body));
  } else {
    throw Exception('Erreur lors de la récupération des statistiques');
  }
}
}
