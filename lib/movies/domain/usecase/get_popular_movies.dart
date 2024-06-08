import 'package:movie_app/movies/domain/repository/movies_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase({required this.baseMoviesRepository});

  execute() async {
    return await baseMoviesRepository.getPopulsrMovies();
  }
}
