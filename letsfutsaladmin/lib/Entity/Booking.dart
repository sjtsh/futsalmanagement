class Booking {
  int id;
  String court_type;
  DateTime date;
  DateTime start_time;
  DateTime end_time;
  int price;

  Booking(
      this.id,
      this.court_type,
      this.date,
      this.start_time,
      this.end_time,
      this.price,
      );

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      json["id"],
      json["court_type"],
      DateTime.parse(json["date"]),
      DateTime.parse(json["start_time"]),
      DateTime.parse(json["end_time"]),
      json["price"],
    );
  }
}
