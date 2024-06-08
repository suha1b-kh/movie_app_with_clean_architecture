import 'package:movie_app/movies/domain/repository/movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase({required this.baseMoviesRepository});

  execute() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
