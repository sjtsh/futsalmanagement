class TournamentEntity {
  int id;
  String admin;
  String name;
  DateTime startDate;
  DateTime endDate;
  String courtType;
  String organizer;
  int cost;

  TournamentEntity(
    this.id,
    this.admin,
    this.name,
    this.startDate,
    this.endDate,
    this.courtType,
    this.organizer,
    this.cost,
  );

  factory TournamentEntity.fromJson(Map<String, dynamic> json) {
    return TournamentEntity(
        json["id"],
        json["admin"],
        json["name"],
        DateTime.parse(json["start_date"]),
        DateTime.parse(json["end_date"]),
        json["court_type"],
        json["organizer"],
        int.parse(json["registration_cost"]));
  }
}
