import 'package:flutter/material.dart';

import 'model/popular_anime_model.dart';

//test
class PopularAnime extends StatelessWidget {
  PopularAnime({super.key});
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 295,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 190,
          itemCount: popularAnimeList.length,
          itemBuilder: (context, int index) {
            final animeList = popularAnimeList[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                  child: Column(
                children: [
                  Image(image: AssetImage(animeList.imageSmall)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    animeList.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              )),
            );
          }),
    );
  }
}

class AnimeList extends StatelessWidget {
  const AnimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
