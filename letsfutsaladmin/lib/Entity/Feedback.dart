class FeedbackMy {
  String name;
  String description;
  DateTime created;
  String createdBy;

  FeedbackMy(
    this.name,
    this.description,
    this.created,
    this.createdBy,
  );

  factory FeedbackMy.fromJson(Map<String, dynamic> json) {
  print(json);
    return FeedbackMy(json["name"], json["description"],
        DateTime.parse(json["created"]), json["created_by"]);
  }
}
