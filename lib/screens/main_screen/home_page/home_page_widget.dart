import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:re_anime/screens/main_screen/home_page/popular_anime/pipular_anime.dart';

import 'coming_son_anime/coming_soon_anime_widget.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color.fromARGB(255, 7, 10, 5),
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

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ComingSoonAnimeWidget.create(),
          ),
        ),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              'Coming Soon',
              style: TextStyle(fontSize: 26),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopularAnime(),
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
            child: PopularAnime(),
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
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopularAnime(),
          ),
        ),

        // add Sliver widget
      ],
    );
  }
}
