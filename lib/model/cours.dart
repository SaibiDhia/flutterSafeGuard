import 'dart:convert'; 
import 'package:http/http.dart' as http;

class CoursProgramme{
  final String id;
  final String type;
  final String description;
  //final String image;

 CoursProgramme({
    required this.id,
    required this.type,
    required this.description,
   //required this.image,
  });

  factory CoursProgramme.fromJson(Map<String, dynamic> json) {
   

    return CoursProgramme(
      id: json['_id'],
      type: json['Type'],
      description: json['description'],
     //image: json['image'],
  
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'type': type,
      'description': description,
      //'image': image,
     
    };
   }
}


 
