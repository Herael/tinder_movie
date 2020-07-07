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
      cover: "https://image.tmdb.org/t/p/w500" + json['poster_path'].toString(),
      description: json['description'].toString(),
      date: json['release_date'].toString(),
      rate: json['vote_average'].toString(),
    );
  }
}
