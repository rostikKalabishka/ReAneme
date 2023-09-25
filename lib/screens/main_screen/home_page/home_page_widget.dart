import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_anime/screens/main_screen/home_page/popular_anime/pipular_anime.dart';

import 'anime_ongoing/anime_ongoing.dart';
import 'anime_ongoing/anime_ongoing_model/anime_ongoing_model.dart';
import 'anime_tv/anime_tv_widget.dart';
import 'anime_tv/model/anime_tv_model.dart';
import 'coming_son_anime/coming_soon_anime_widget.dart';
import 'coming_son_anime/models/coming_soon_anime_model.dart';
import 'movie/movie_anime.dart';
import 'movie/movie_anime_model/movie_anime_model.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final animeTVModel = AnimeTVModel();
    final comingSoonAnimeModel = ComingSoonAnimeModel();
    final animeMovieModel = AnimeMovieModel();
    final animeOngoingModel = AnimeOngoingModel();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: comingSoonAnimeModel,
          child: const TrendingAnimeWidget(),
        ),
        ChangeNotifierProvider.value(
          value: animeTVModel,
          child: const AnimeTVWidget(),
        ),
        ChangeNotifierProvider.value(
          value: animeMovieModel,
          child: const AnimeMovieWidget(),
        ),
        ChangeNotifierProvider.value(
          value: animeOngoingModel,
          child: const AnimeOngoingWidget(),
        )
      ],
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 7, 10, 5),
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl:
                    'https://i.pinimg.com/originals/7c/12/72/7c12727320e9107bd656c581af98067f.gif',
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Trending Anime',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TrendingAnimeWidget(),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Text(
                'Ongoing',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimeOngoingWidget(),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Movie',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimeMovieWidget(),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'TV',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: AnimeTVWidget(),
            ),
          ),

          // add Sliver widget
        ],
      ),
    );
  }
}
