class ApiConstances {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "53c5f4376041cb5011884241614a7d9a";
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
}
