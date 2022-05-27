class Opponent {
  int id;
  String name;
  DateTime startTime;
  DateTime endTime;
  DateTime date;
  int booking;

  Opponent(
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.date,
    this.booking,
  );

  factory Opponent.fromJson(Map<String, dynamic> json) {
    return Opponent(
        json["id"],
        json["user"],
        DateTime.parse(json["start_time"]),
        DateTime.parse(json["end_time"]),
        DateTime.parse(json["date"]),
        json["booking"]);
  }
}
