import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/network/api_constances.dart';
// import 'package:movie_app/core/error/exception.dart';
// import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstances.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      return [];
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstances.popularMoviesPath);
    if (response.statusCode == 200) {
      // log((response.data["results"])
      //     .map((e) => MovieModel.fromJson(e).toString()));
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      return [];
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstances.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      return [];
    }
  }
}
