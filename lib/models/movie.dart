class Movie {
  final String id;
  final String title;
  final String cover;
  final String description;
  final String date;
  final String rate;

  Movie({this.id, this.title, this.cover, this.description, this.date, this.rate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'].toString(),
      title: json['title'].toString(),
      cover: json['cover'].toString(),
      description: json['description'].toString(),
      date: json['date'].toString(),
      rate: json['rate'].toString(),
    );
  }
}
