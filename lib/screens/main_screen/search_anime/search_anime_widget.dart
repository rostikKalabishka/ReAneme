import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widget/text_form_field_widget.dart';
import '../../../widget/text_widget.dart';

import 'model/search_model.dart';

class SearchAnimeWidget extends StatefulWidget {
  const SearchAnimeWidget({super.key});

  @override
  State<SearchAnimeWidget> createState() => _SearchAnimeWidgetState();

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => SearchModel(),
      child: const SearchAnimeWidget(),
    );
  }
}

class _SearchAnimeWidgetState extends State<SearchAnimeWidget> {
  @override
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
    return const Padding(
        padding: EdgeInsets.all(8.0),
        child: TextFormFiledWidget(
          hintText: 'Search...',
          obscureText: false,
        ));
  }
}

class AnimeList extends StatefulWidget {
  AnimeList({super.key});

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  @override
  void didChangeDependencies() {
    final model = context.watch<SearchModel>();
    model.loadAnime();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchModel>();
    var anime = model.anime;
    if (anime == null) {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.red,
      ));
    }

    final popularAnimeList = anime.data;

    return Flexible(
      child: ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        // itemExtent: 210,
        itemCount: anime.data.length,
        itemBuilder: (context, int index) {
          final animeList = popularAnimeList[index];
          final tiny = animeList.attributes.posterImage.tiny;
          final title = animeList.attributes.titles.enJp;
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
                      child: Image.network(
                        tiny,
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
                            label: title,
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
