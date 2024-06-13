import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class MoviesState {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String playingNowMessage;

  MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.playingNowMessage = "",
  });
}
