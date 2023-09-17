import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../popular_anime/model/popular_anime_model.dart';
import 'models/coming_soon_anime_model.dart';

class ComingSoonAnimeWidget extends StatefulWidget {
  ComingSoonAnimeWidget({super.key});
  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => ComingSoonAnimeModel(),
      child: ComingSoonAnimeWidget(),
    );
  }

  @override
  State<ComingSoonAnimeWidget> createState() => _ComingSoonAnimeWidgetState();
}

class _ComingSoonAnimeWidgetState extends State<ComingSoonAnimeWidget> {
  final CarouselController _carouselController = CarouselController();

  final Cubic customCurves = const Cubic(0.0, 0.0, 0.0, 0.0);

  @override
  void didChangeDependencies() {
    final model = context.watch<ComingSoonAnimeModel>();
    model.setup();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ComingSoonAnimeModel>();
    final anime = model.anime;
    if (anime == null) {
      return const Center(child: CircularProgressIndicator());
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
          final animeList = model.anime!.data[index];

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
