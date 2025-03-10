class Movie {
   String name;
  Movie(this.name);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['name'],
    );
  }
}