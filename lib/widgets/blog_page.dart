import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: BlogPage(),
  ));
}

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Page'),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.network(
            "assets/images/backgroun2.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          // Cadre Blanc Non Transparent
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            margin: const EdgeInsets.fromLTRB(16, 80, 16, 16),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Table Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Title', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    Text('Type of Catastrophe', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    Text('Creation Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    Text('Actions', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 8),
                // Table Rows (Example)
                _buildTableRow('Blog Title 1', 'Natural Disaster', '2023-12-05', context,
                    image: 'Image URL',
                    dateDePrevention: 'Prevention Date',
                    region: 'Region',
                    pays: 'Country',
                    statement: 'Statement',
                    description: 'Description'),
                _buildTableRow('Blog Title 2', 'Man-Made Disaster', '2023-12-06', context,
                    image: 'Image URL',
                    dateDePrevention: 'Prevention Date',
                    region: 'Region',
                    pays: 'Country',
                    statement: 'Statement',
                    description: 'Description'),
                // Ajoutez plus de lignes au besoin
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(String title, String type, String creationDate, BuildContext context,
      {required String image,
      required String dateDePrevention,
      required String region,
      required String pays,
      required String statement,
      required String description}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(color: Colors.black)),
            Text(type, style: TextStyle(color: Colors.black)),
            Text(creationDate, style: TextStyle(color: Colors.black)),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Gérer le bouton Éditer
                  },
                  icon: Icon(Icons.edit, color: Colors.green),
                ),
                IconButton(
                  onPressed: () {
                    // Gérer le bouton Supprimer
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
                IconButton(
                  onPressed: () {
                    // Gérer le bouton Détails
                    _showDetailsDialog(context, title, type, creationDate,
                        image: image,
                        dateDePrevention: dateDePrevention,
                        region: region,
                        pays: pays,
                        statement: statement,
                        description: description);
                  },
                  icon: Icon(Icons.details, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {
                    // Gérer le bouton Commentaire
                    _showCommentsDialog(context, title);
                  },
                  icon: Icon(Icons.comment, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _showDetailsDialog(BuildContext context, String title, String type, String creationDate,
      {required String image,
      required String dateDePrevention,
      required String region,
      required String pays,
      required String statement,
      required String description}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Détails du Blog'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Titre : $title'),
              Text('Image: $image'),
              Text('Type de Catastrophe : $type'),
              Text('Date de Prevention: $dateDePrevention'),
              Text('region: $region'),
              Text('pays: $pays'),
              Text('Statement: $statement'),
              Text('Description: $description'),
              // Ajoutez plus de détails au besoin
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  void _showCommentsDialog(BuildContext context, String title) {
    // Exemple de liste de commentaires
    List<String> comments = [
      'Commentaire 1',
      'Commentaire 2',
      'Commentaire 3',
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Commentaires pour $title'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (String comment in comments) Text(comment),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}
