import 'package:flutter/material.dart';
import 'package:re_anime/domain/anime_api/anime_api.dart';

import '../../../../domain/entity/anime/anime_entity.dart';

class SearchModel extends ChangeNotifier {
  final _animeApi = AnimeApi();
  int limit = 10;
  late int offset = 0;
  AnimeEntity? _anime;
  final _animeList = <Data>[];
  // AnimeEntity? get anime => _anime;

  List<Data> get animeList => List.unmodifiable(_animeList);

  Future<void> setup() async {
    // _animeList.clear();
    await loadAnime();
  }

  Future<void> loadPage() async {
    offset += 10;
    loadAnime();
  }

  Future<void> loadAnime() async {
    var newItems = await _animeApi.getAnime(limit, offset);
    _animeList.addAll(newItems.data);

    notifyListeners();
  }

  // void showAnimeAtIndex(int index) {
  //   if (index <= _anime!.data.length) return;
  //   loadPage();
  // }
}
