
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cours.dart';
import 'dart:io';


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
  
  Future<void> addCoursProgramme({
    required String type,
    required String description,
    required File image,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('http://localhost:9090/cours/'));
    request.fields['Type'] = type;
    request.fields['description'] = description;
    var fileStream = http.ByteStream(image.openRead());
    var length = await image.length();
    var multipartFile = http.MultipartFile('image', fileStream, length,
        filename: image.path.split('/').last);

    request.files.add(multipartFile);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print('Cours ajouté avec succès');
      } else {
        print('Erreur lors de l\'ajout du cours: ${response.statusCode}');
      }
    } catch (error) {
      print('Erreur lors de l\'ajout du cours: $error');
    }
  }
}
