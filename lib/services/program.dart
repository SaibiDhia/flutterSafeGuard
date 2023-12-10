
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
    final response = await http.delete(Uri.parse('http://localhost:9090/programme/$titre'));

    if (response.statusCode == 200) {
      print('Programme supprimé avec succès');
    } else {
      throw Exception('Erreur lors de la suppression du programme');
    }
  }
}
