import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';
import '../popular_anime/model/popular_anime_model.dart';

class ComingSoonAnimeWidget extends StatelessWidget {
  ComingSoonAnimeWidget({super.key});
  var popularAnimeList = [
    PopularAnimeModel(
        id: 1,
        imageSmall: 'assets/images/small.jpg',
        name: 'Beebop1sssssssssssssssssssssssssssssssssssss'),
    PopularAnimeModel(
        id: 2, imageSmall: 'assets/images/small.jpg', name: 'Beebop2'),
    PopularAnimeModel(
        id: 3, imageSmall: 'assets/images/small.jpg', name: 'Beebop3'),
    PopularAnimeModel(
        id: 4, imageSmall: 'assets/images/small.jpg', name: 'Beebop4'),
    PopularAnimeModel(
        id: 5, imageSmall: 'assets/images/small.jpg', name: 'Beebop5'),
  ];

  final CarouselController _carouselController = CarouselController();
  final Cubic customCurves = const Cubic(0.0, 0.0, 0.0, 0.0);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: CarouselSlider.builder(
        carouselController: _carouselController,
        itemCount: popularAnimeList.length,
        options: CarouselOptions(
            viewportFraction: 0.55,
            aspectRatio: 1,
            enlargeCenterPage: true,
            initialPage: 2,
            autoPlay: true,
            // autoPlayInterval: const Duration(microseconds: 1),
            autoPlayAnimationDuration: const Duration(seconds: 5),
            autoPlayCurve: customCurves,
            scrollPhysics: const BouncingScrollPhysics(),
            pauseAutoPlayOnTouch: false),
        itemBuilder: (context, int index, realIndex) {
          final animeList = popularAnimeList[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image(image: AssetImage(animeList.imageSmall)),
                      Positioned(
                        top: 5,
                        left: 10,
                        child: Text(
                          animeList.name,
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

  // child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemExtent: 170,
  //         itemCount: popularAnimeList.length,
  //         itemBuilder: (context, int index) {
  //           final animeList = popularAnimeList[index];
  //           return Padding(
  //             padding: const EdgeInsets.all(10),
  //             child: ClipRRect(
  //                 child: Column(
  //               children: [
  //                 Image(image: AssetImage(animeList.imageSmall)),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 Text(
  //                   animeList.name,
  //                   overflow: TextOverflow.ellipsis,
  //                   maxLines: 2,
  //                 )
  //               ],
  //             )),
  //           );
  //         }),