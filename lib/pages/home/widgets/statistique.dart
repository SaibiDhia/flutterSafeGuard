import 'package:flutter/material.dart';
import '../../../services/cours.dart';

class StatistiquesPage extends StatefulWidget {
  @override
  _StatistiquesPageState createState() => _StatistiquesPageState();
}

class _StatistiquesPageState extends State<StatistiquesPage> {
  final CoursService coursService = CoursService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiques des cours favoris par type'),
      ),
      body: FutureBuilder<Map<String, int>?>(
        future: coursService.getStatistiqueNombreFavorisParTypeCours(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erreur: ${snapshot.error}'),
            );
          } else {
            final statistiques = snapshot.data ?? {}; // Default to an empty map if null
            return _buildStatistiquesList(statistiques);
          }
        },
      ),
    );
  }

  Widget _buildStatistiquesList(Map<String, int> statistiques) {
    return ListView.builder(
      itemCount: statistiques.length,
      itemBuilder: (context, index) {
        final typeCours = statistiques.keys.toList()[index];
        final nombreFavoris = statistiques[typeCours];

        return Card(
          elevation: 2.0,
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(16.0),
            title: Text(
              'Type de cours: $typeCours',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Nombre de favoris: $nombreFavoris',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StatistiquesPage(),
  ));
}
