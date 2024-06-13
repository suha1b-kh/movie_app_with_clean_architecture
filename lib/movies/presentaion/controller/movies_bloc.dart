import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movie_app/movies/presentaion/controller/movies_event.dart';
import 'package:movie_app/movies/presentaion/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      // BaseMovieRemoteDataSource baseMovieRemoteDataSource =
      //     MovieRemoteDataSource();
      // BaseMoviesRepository baseMoviesRepository = MoviesRepository(
      //     baseMovieRemoteDataSource: baseMovieRemoteDataSource);
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(MoviesState(
                nowPlayingState: RequestState.error,
                playingNowMessage: l.message,
              )),
          (r) => MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded));
    });
  }
}
