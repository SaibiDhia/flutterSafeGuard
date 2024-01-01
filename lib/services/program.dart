import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/program.dart';
import 'package:http_parser/http_parser.dart';

class ProgramService {

Future<int> getTotalNombreProgrammes() async {
    final response = await http.get(Uri.parse('http://localhost:9090/programme/total/nb'));

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return data['Programme'] as int;
    } else {
      throw Exception('Erreur lors de la récupération du nombre total de programme');
    }
  }



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

  Future<void> addProgram(
      String titre, String description, List<String> cours, String image) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://localhost:9090/programme/'),
      );

      request.fields['Titre'] = titre;
      request.fields['descriptionProgramme'] = description;
      request.fields['cours'] = jsonEncode(cours);

      var imageResponse = await http.get(Uri.parse(image));
      List<int> imageBytes = imageResponse.bodyBytes;

      request.files.add(http.MultipartFile.fromBytes(
        'source',
        imageBytes,
        filename: 'image.jpg',
        contentType: MediaType('image', 'jpg'),
      ));

      print('Request Fields: ${request.fields}');
      print('Request Files: ${request.files}');

      var response = await request.send();
      print('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('Programme ajouté avec succès!');
      } else {
        print('Échec de l ajout du programme ${response.statusCode}');
        print('Response Body: ${await response.stream.bytesToString()}');
      }
    } catch (error) {
      print('Erreur lors de l ajout du programme: $error');
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
