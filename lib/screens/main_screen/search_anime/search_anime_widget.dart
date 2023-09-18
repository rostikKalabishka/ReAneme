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
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextWidget(
              label: 'Discover',
              fontSize: 32,
              maxLines: 1,
            ),
            SearchAnimeTextField(),
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
  // final _searchController = TextEditingController();

  // // var _filterAnime = <PopularAnimeModel>[];
  // void _searchAnime() {}
  // @override
  // void initState() {
  //   _searchController.addListener(_searchAnime);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchModel>();
    if (model == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: TextFormFiledWidget(
          onChanged: model.searchAnime,
          hintText: 'Search...',
          obscureText: false,
        ));
  }
}

class AnimeList extends StatefulWidget {
  const AnimeList({super.key});

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  final controller = ScrollController();

  @override
  void initState() {
    final model = context.read<SearchModel>();
    model.loadPage(controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchModel>();

    var anime = model.animeList;
    if (anime == null) {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.red,
      ));
    }

    final popularAnimeList = anime;

    return Flexible(
      child: ListView.separated(
        controller: controller,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        // itemExtent: 210,
        itemCount: anime.length + 1,
        itemBuilder: (context, int index) {
          if (index < popularAnimeList.length) {
            // model.showAnimeAtIndex(index);
            final animeList = popularAnimeList[index];
            final tiny = animeList.attributes.posterImage.tiny;
            final titleEnJp = animeList.attributes.titles.enJp;
            final titleEn = animeList.attributes.titles.en;
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
                        child: tiny != null
                            ? Image.network(
                                tiny,
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
                            TextWidget(
                              label: titleEnJp ?? titleEn ?? ' ',
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
          } else {
            // model.loadPage();

            return const Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              )),
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
