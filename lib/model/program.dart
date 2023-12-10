import 'dart:convert'; 
import 'package:http/http.dart' as http;

class Program {
  final String id;
  final String titre;
  final String descriptionProgramme;
  final String image;
  List<String> cours; 

  Program({
    required this.id,
    required this.titre,
    required this.descriptionProgramme,
    required this.image,
    required this.cours,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    List<String> coursList =
        (json['cours'] as List).map((id) => id.toString()).toList();

    return Program(
      id: json['_id'],
      titre: json['Titre'],
      descriptionProgramme: json['descriptionProgramme'],
      image: json['image'],
      cours: coursList,
    );
  }
}
