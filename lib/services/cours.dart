
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cours.dart';

class CoursService {
  Future<List<CoursProgramme>> getCours() async {
    final response =
        await http.get(Uri.parse('http://localhost:9090/cours/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => CoursProgramme.fromJson(item)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des cours');
    }
  }
  
  Future<void> deleteCours(String id) async {
    final response = await http.delete(Uri.parse('http://localhost:9090/cours/$id'));

    if (response.statusCode == 200) {
      print('Cours supprimé avec succès');
    } else {
      throw Exception('Erreur lors de la suppression du cours');
    }
  }
}
