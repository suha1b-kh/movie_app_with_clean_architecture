import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_constances.dart';
import 'package:movie_app/core/utils/dummy.dart';
import 'package:movie_app/movies/presentaion/controller/movies_bloc.dart';
import 'package:movie_app/movies/presentaion/controller/movies_state.dart';

Widget nowPlayingComponent() {
  return BlocBuilder<MoviesBloc, MoviesState>(
    builder: (context, state) {
      print(state.nowPlayingState);
      return FadeIn(
        duration: const Duration(milliseconds: 500),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {},
          ),
          items: state.nowPlayingMovies.map(
            (item) {
              return GestureDetector(
                key: const Key('openMovieMinimalDetail'),
                onTap: () {
                  /// TODO : NAVIGATE TO MOVIE DETAILS
                },
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // fromLTRB
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0, 0.3, 0.5, 1],
                        ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        height: 560.0,
                        imageUrl: ApiConstances.imageUrl(item.backDropath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.circle,
                                  color: Colors.redAccent,
                                  size: 16.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  'Now Playing'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      );
    },
  );
}
