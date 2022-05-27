class UserBooking {
  String user1;
  String user2;
  String court_type;
  DateTime date;
  DateTime startTime;
  DateTime endTime;
  int price;
  DateTime created;

  UserBooking(
    this.user1,
    this.user2,
    this.court_type,
    this.date,
    this.startTime,
    this.endTime,
    this.price,
    this.created,
  );

  factory UserBooking.fromJson(Map<String, dynamic> json) {
    return UserBooking(
        json["user1"].toString(),
        json["user2"].toString(),
        json["court_type"],
        DateTime.parse(json["date"]),
        DateTime.parse(json["start_time"]),
        DateTime.parse(json["end_time"]),
        json["price"],
        DateTime.parse(json["created"]));
  }
}
