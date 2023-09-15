import 'package:flutter/material.dart';

import '../../../widget/text_widget.dart';
import '../home_page/popular_anime/model/popular_anime_model.dart';

class SearchAnimeWidget extends StatelessWidget {
  const SearchAnimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [const SearchAnimeTextField(), AnimeList()],
        ),
      ),
    );
  }
}

class SearchAnimeTextField extends StatelessWidget {
  const SearchAnimeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: 'Search',
        ),
      ),
    );
  }
}

// class AnimeList extends StatelessWidget {
//   AnimeList({super.key});
//   var popularAnimeList = [
//     PopularAnimeModel(
//         id: 1,
//         imageSmall: 'assets/images/small.jpg',
//         name: 'Beebop1sssssssssssssssssssssssssssssssssssss'),
//     PopularAnimeModel(
//         id: 2, imageSmall: 'assets/images/small.jpg', name: 'Beebop2'),
//     PopularAnimeModel(
//         id: 3, imageSmall: 'assets/images/small.jpg', name: 'Beebop3'),
//     PopularAnimeModel(
//         id: 4, imageSmall: 'assets/images/small.jpg', name: 'Beebop4'),
//     PopularAnimeModel(
//         id: 5, imageSmall: 'assets/images/small.jpg', name: 'Beebop5'),
//   ];
// List popularAnimeList = <PopularAnimeModel>[];

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: ListView.builder(
//           itemCount: popularAnimeList.length,
//           itemBuilder: (context, int index) {
//             final animeList = popularAnimeList[index];
//             return Padding(
//               padding: const EdgeInsets.all(5),
//               child: ClipRRect(
//                   child: Row(
//                 children: [
//                   Image(
//                     image: AssetImage(animeList.imageSmall),
//                     height: 200,
//                     width: 120,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     child: Text(
//                       animeList.name,
//                       overflow: TextOverflow.ellipsis,
//                       softWrap: false,
//                       maxLines: 2,
//                     ),
//                   )
//                 ],
//               )),
//             );
//           }),
//     );
//   }
// }

class AnimeList extends StatelessWidget {
  AnimeList({super.key});
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
  // List popularAnimeList = <PopularAnimeModel>[];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemExtent: 210,
            itemCount: popularAnimeList.length,
            itemBuilder: (context, int index) {
              final animeList = popularAnimeList[index];
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                clipBehavior: Clip.hardEdge,
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(animeList.imageSmall),
                          width: 140,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            TextWidget(
                              label: animeList.name,
                              fontSize: 16,
                              maxLines: 1,
                              fontWeight: FontWeight.normal,
                            )
                          ],
                        ))
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
