class Catastrophe {
  final String titre;
  final String type;
  final String description;
  final DateTime date;
  final double radius;
  final double magnitude;
  final double latitudeDeCatastrophe;
  final double longitudeDeCatastrophe;

  Catastrophe({
    required this.titre,
    required this.type,
    required this.description,
    required this.date,
    required this.radius,
    required this.magnitude,
    required this.latitudeDeCatastrophe,
    required this.longitudeDeCatastrophe,
  });

  factory Catastrophe.fromJson(Map<String, dynamic> json) {
    return Catastrophe(
      titre: json['titre'],
      type: json['type'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      radius: json['radius'].toDouble(),
      magnitude: json['magnitude'].toDouble(),
      latitudeDeCatastrophe: json['latitudeDeCatastrophe'].toDouble(),
      longitudeDeCatastrophe: json['longitudeDeCatastrophe'].toDouble(),
    );
  }
}
