class Tags {
  Tags({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
