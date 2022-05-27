class Notice {
  String admin;
  String description;
  String subject;

  Notice(
    this.admin,
    this.description,
    this.subject,
  );

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(json["admin"], json["description"], json["subject"]);
  }
}
