class Tournament {
  String admin;
  String name;
  DateTime startDate;
  DateTime endDate;
  String courtType;
  String organizer;
  int registrationCost;

  Tournament(
    this.admin,
    this.name,
    this.startDate,
    this.endDate,
    this.courtType,
    this.organizer,
    this.registrationCost,
  );

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      json["admin"],
      json["name"],
      DateTime.parse(json["start_date"]),
      DateTime.parse(json["end_date"]),
      json["court_type"],
      json["organizer"],
      int.parse(json["registration_cost"]),
    );
  }
}
