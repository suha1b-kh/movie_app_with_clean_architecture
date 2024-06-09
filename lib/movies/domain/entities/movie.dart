class Movie {
  final int id;
  final String title;
  final String backDropath;
  final List<int> genreIds;
  final String overView;
  final num voteAvg;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backDropath,
    required this.genreIds,
    required this.overView,
    required this.voteAvg,
    required this.releaseDate,
  });
}
