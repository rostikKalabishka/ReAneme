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
  void didChangeDependencies() {
    context.read<SearchModel>();

    super.didChangeDependencies();
  }

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
        padding: const EdgeInsets.all(8.0),
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
  Widget build(BuildContext context) {
    final model = context.watch<SearchModel>();
    var anime = model.anime;

    final popularAnimeList = anime?.data;

    return Flexible(
      child: ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        // itemExtent: 210,
        itemCount: anime?.data.length ?? 0,
        itemBuilder: (context, int index) {
          final animeList = popularAnimeList?[index];
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
                      child: animeList != null
                          ? Image(
                              image: AssetImage(
                                  animeList.attributes.posterImage.medium),
                              width: 100,
                            )
                          : const SizedBox.shrink(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          animeList != null
                              ? TextWidget(
                                  label: animeList.attributes.titles.enJp,
                                  fontSize: 16,
                                  maxLines: 1,
                                  fontWeight: FontWeight.normal,
                                )
                              : const SizedBox.shrink(),
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
