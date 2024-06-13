import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movies_repositry.dart';
import 'package:movie_app/movies/domain/repository/movies_repository.dart';
import 'package:movie_app/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movie_app/movies/presentaion/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //BLOC
    sl.registerFactory(() => MoviesBloc(sl()));
    //Use case
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMoviesRepository: sl()));
    //Repositry
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMovieRemoteDataSource: sl()));
    //Data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
