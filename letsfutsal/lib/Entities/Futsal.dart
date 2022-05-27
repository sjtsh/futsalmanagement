class Futsal{
int id;
  String name;
  double lat;
  double lng;
  Futsal(this.id, this.name, this.lat, this.lng);

  factory Futsal.fromJson(Map<String, dynamic> json){
  return Futsal(json["id"], json["name"], json["latitude"], json["longitude"]);
  }

}