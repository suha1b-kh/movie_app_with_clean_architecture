import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.backDropath,
    required super.genreIds,
    required super.overView,
    required super.voteAvg,
    required super.releaseDate,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        backDropath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        overView: json["overview"],
        voteAvg: json["vote_average"],
        releaseDate: json["release_date"],
      );
}
