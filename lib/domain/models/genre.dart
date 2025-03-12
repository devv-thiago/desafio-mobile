class Genre {
  String name;
  int id;
  Genre(this.id, this.name,);

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      json['id'],
      json['name'],
    );
  }
}
