import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/coming_soon_anime_model.dart';

class TrendingAnimeWidget extends StatefulWidget {
  const TrendingAnimeWidget({super.key});

  @override
  State<TrendingAnimeWidget> createState() => _TrendingAnimeWidgetState();
}

class _TrendingAnimeWidgetState extends State<TrendingAnimeWidget> {
  final CarouselController _carouselController = CarouselController();

  final Cubic customCurves = const Cubic(0.0, 0.0, 0.0, 0.0);

  @override
  void initState() {
    final model = context.read<ComingSoonAnimeModel>();
    model.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ComingSoonAnimeModel>();
    final anime = model.anime;
    if (anime == null) {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.red,
      ));
    }
    return SizedBox(
      height: 350,
      child: CarouselSlider.builder(
        carouselController: _carouselController,
        itemCount: model.anime?.data.length,
        options: CarouselOptions(
            viewportFraction: 0.55,
            aspectRatio: 1,
            enlargeCenterPage: true,
            autoPlay: true,
            // autoPlayInterval: const Duration(microseconds: 1),
            autoPlayAnimationDuration: const Duration(seconds: 5),
            autoPlayCurve: customCurves,
            scrollPhysics: const BouncingScrollPhysics(),
            pauseAutoPlayOnTouch: false),
        itemBuilder: (context, int index, realIndex) {
          final animeList = model.anime?.data[index];

          if (animeList == null) {
            return const SizedBox.shrink();
          }
          final medium = animeList.attributes.posterImage.medium;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(medium)),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          animeList.attributes.titles.enJp,
                          style: const TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
