import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getPopulsrMovies();
  Future<List<Movie>> getTopRatedMovies();
}
