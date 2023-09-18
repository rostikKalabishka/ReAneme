import 'package:flutter/material.dart';
import 'package:re_anime/domain/anime_api/anime_api.dart';

import '../../../../domain/entity/anime/anime_entity.dart';

class SearchModel extends ChangeNotifier {
  final _animeApi = AnimeApi();
  int limit = 10;
  // var offset = 0;
  AnimeEntity? _anime;
  final _animeList = <Data>[];
  // AnimeEntity? get anime => _anime;
  var _isLoadingInProgress = false;
  List<Data> get animeList => List.unmodifiable(_animeList);

  // Future<void> setup() async {
  //   // _animeList.clear();
  //   loadAnime(offset);
  // }

  // Future<void> loadPage() async {
  //   _isLoadingInProgress = true;

  //   print(offset);

  //   await loadAnime();
  // }

  Future<void> loadAnime(int offset) async {
    var newItems = await _animeApi.getAnime(limit, offset);
    // offset += 10;
    // // _anime?.links.prev = _animeList.addAll(newItems.data);
    _animeList.addAll(newItems.data);
    _isLoadingInProgress = false;
    notifyListeners();
  }

  void showAnimeAtIndex(int index) {
    print(_animeList.length);
    print(index);
    if (index <= _animeList.length - 1) return;
    // loadAnime();
  }
}
