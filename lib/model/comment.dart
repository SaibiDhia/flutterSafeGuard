class Commentaire {
  final String textComment;
  final String idCoursProgramme;
  final String idUser;

  Commentaire({
    required this.textComment,
    required this.idCoursProgramme,
    required this.idUser,
  });

  factory Commentaire.fromJson(Map<String, dynamic> json) {
    return Commentaire(
      textComment: json['textComment'],
      idCoursProgramme: json['idCoursProgramme'],
      idUser: json['idUser'],
    );
  }
}
