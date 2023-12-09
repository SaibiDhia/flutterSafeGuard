import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:garduino_dashboard/model/ZoneDeDanger.dart';
import 'package:http/http.dart' as http;

class ApiZoneDeDanger {
  static Future<List<ZoneDeDanger>> getZoneDeDanger() async {
    var url = Uri.parse('http://127.0.0.1:9090/zoneDeDanger');
    var response = await http.get(url);
    List<ZoneDeDanger> zoneDeDangerList = [];

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        zoneDeDangerList.add(ZoneDeDanger.fromJson(noteJson));
      }
    }

    return zoneDeDangerList;
  }

  static Future<ZoneDeDanger> createZoneDeDanger(String idUser,
      double latitudeDeZoneDanger, double longitudeDeZoneDanger) async {
    var url = Uri.parse('http://127.0.0.1:9090/zoneDeDanger');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'idUser': idUser,
          'latitudeDeZoneDanger': latitudeDeZoneDanger,
          'longitudeDeZoneDanger': longitudeDeZoneDanger
        }));

    if (response.statusCode == 200) {
      var zoneDeDangerJson = json.decode(response.body);
      return ZoneDeDanger.fromJson(zoneDeDangerJson);
    } else {
      throw Exception('Failed to create ZoneDeDanger');
    }
  }
}
