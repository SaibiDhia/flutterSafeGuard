class ZoneDeDanger {
  final double latitudeDeZoneDanger;
  final double longitudeDeZoneDanger;
  final String idUser;
  ZoneDeDanger(
      {required this.latitudeDeZoneDanger,
      required this.longitudeDeZoneDanger,
      required this.idUser});

  factory ZoneDeDanger.fromJson(Map<String, dynamic> json) {
    return ZoneDeDanger(
      latitudeDeZoneDanger: json['latitudeDeZoneDanger'],
      longitudeDeZoneDanger: json['longitudeDeZoneDanger'],
      idUser: json['idUser'],
    );
  }
}
