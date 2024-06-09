import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/movies_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase({required this.baseMoviesRepository});

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getPopulsrMovies();
  }
}
