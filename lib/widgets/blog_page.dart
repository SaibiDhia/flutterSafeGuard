import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: BlogPage(),
  ));
}

class Blog {
  String title;
  String type;
  String creationDate;
  String image;
  String dateDePrevention;
  String region;
  String pays;
  String statement;
  String description;

  Blog({
    required this.title,
    required this.type,
    required this.creationDate,
    required this.image,
    required this.dateDePrevention,
    required this.region,
    required this.pays,
    required this.statement,
    required this.description,
  });
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
          Container(
            color: Colors.lightBlue.withOpacity(0.5), // Background color with transparency
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
              color: Colors.white.withOpacity(0.8), // Adjust transparency as needed
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
                _buildTableRow(
                  Blog(
                    title: 'Blog Title 1',
                    type: 'Natural Disaster',
                    creationDate: '2023-12-05',
                    image: 'Image URL',
                    dateDePrevention: 'Prevention Date',
                    region: 'Region',
                    pays: 'Country',
                    statement: 'Statement',
                    description: 'Description',
                  ),
                  context,
                ),
                _buildTableRow(
                  Blog(
                    title: 'Blog Title 2',
                    type: 'Man-Made Disaster',
                    creationDate: '2023-12-06',
                    image: 'Image URL',
                    dateDePrevention: 'Prevention Date',
                    region: 'Region',
                    pays: 'Country',
                    statement: 'Statement',
                    description: 'Description',
                  ),
                  context,
                ),
                // Ajoutez plus de lignes au besoin
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(Blog blog, BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(blog.title, style: TextStyle(color: Colors.black)),
            Text(blog.type, style: TextStyle(color: Colors.black)),
            Text(blog.creationDate, style: TextStyle(color: Colors.black)),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Gérer le bouton Éditer
                    _showEditForm(context, blog);
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
                    _showDetailsDialog(context, blog);
                  },
                  icon: Icon(Icons.details, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {
                    // Gérer le bouton Commentaire
                    _showCommentsDialog(context, blog.title);
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

  void _showEditForm(BuildContext context, Blog blog) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Blog'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Include form fields for editing
              // You can use TextFormField, etc.
              Text('Title: ${blog.title}'),
              Text('Type of Catastrophe: ${blog.type}'),
              // Add more form fields as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Handle save button press
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                // Handle cancel button press
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showDetailsDialog(BuildContext context, Blog blog) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Détails du Blog'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Titre : ${blog.title}'),
              Text('Image : ${blog.image}'),
              Text('Type de Catastrophe : ${blog.type}'),
              Text('Date de Prevention: ${blog.dateDePrevention}'),
              Text('Region: ${blog.region}'),
              Text('Pays: ${blog.pays}'),
              Text('Statement: ${blog.statement}'),
              Text('Description: ${blog.description}'),
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
  // Exemple de liste de commentaires avec identifiants uniques
  List<Map<String, String>> comments = [
    {'comment': 'Excellent article!', 'id': '1'},
    {'comment': 'Thanks for sharing!', 'id': '2'},
    {'comment': 'Interesting insights.', 'id': '3'},
  ];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Commentaires pour $title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Divider(
                color: Colors.black,
                height: 1,
              ),
              const SizedBox(height: 8),
              for (Map<String, String> comment in comments)
                _buildCommentRow(comment),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Fermer',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildCommentRow(Map<String, String> comment) {
  final commentText = comment['comment'] ?? '';
  return Container(
    margin: EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Icon(Icons.account_circle, size: 40, color: Colors.blue),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            commentText,
            style: TextStyle(color: Colors.black),
          ),
        ),
        IconButton(
          onPressed: () {
            // Ajoutez ici la logique pour supprimer le commentaire avec l'ID associé
            print('Supprimer le commentaire avec ID ${comment['id']}');
          },
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      ],
    ),
  );
}

}