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
          children: [
            const SizedBox(
              height: 10,
            ),
            const TextWidget(
              label: 'Discover',
              fontSize: 32,
              maxLines: 1,
            ),
            const SearchAnimeTextField(),
            AnimeList()
          ],
        ),
      ),
    );
  }
}

class SearchAnimeTextField extends StatefulWidget {
  const SearchAnimeTextField({super.key});

  @override
  State<SearchAnimeTextField> createState() => _SearchAnimeTextFieldState();
}

class _SearchAnimeTextFieldState extends State<SearchAnimeTextField> {
  final _searchController = TextEditingController();
  // var _filterAnime = <PopularAnimeModel>[];
  void _searchAnime() {}
  @override
  void initState() {
    _searchController.addListener(_searchAnime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _searchController,
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

class AnimeList extends StatelessWidget {
  AnimeList({super.key});
  final popularAnimeList = [
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
    return Flexible(
      child: ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        // itemExtent: 210,
        itemCount: popularAnimeList.length,
        itemBuilder: (context, int index) {
          final animeList = popularAnimeList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage(animeList.imageSmall),
                        width: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            label: animeList.name,
                            fontSize: 16,
                            maxLines: 1,
                            fontWeight: FontWeight.normal,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
