import 'package:movie_app/movies/domain/repository/movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase({required this.baseMoviesRepository});

  execute() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}
