import 'dart:async';

import 'package:flutter/material.dart';
import 'package:re_anime/domain/anime_api/anime_api.dart';

import '../../../../domain/entity/anime/anime_entity.dart';

class SearchModel extends ChangeNotifier {
  final _animeApi = AnimeApi();
  int limit = 10;
  var offset = 0;
  AnimeEntity? _anime;
  final _animeList = <Data>[];
  String? _searchQuery;
  // AnimeEntity? get anime => _anime;
  Timer? searchDebounce;
  List<Data> get animeList => List.unmodifiable(_animeList);

  Future<void> setup() async {
    _animeList.clear();
    loadAnime(offset);
  }

  void clearResults() {
    _animeList.clear();
    _searchQuery = null;
  }

  Future<void> searchAnime(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 200), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      clearResults();
      _searchQuery = searchQuery;
    });
  }

  Future<void> loadPage(ScrollController controller) async {
    loadAnime(offset);

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        print(offset);
        offset += limit;

        loadAnime(offset);
      }
    });
  }

  Future<void> loadAnime(int offset) async {
    final query = _searchQuery;
    if (query == null) {
      _animeList.clear();
      var newItems = await _animeApi.getAnime(limit, offset);
      _animeList.addAll(newItems.data);
    } else {
      _animeList.clear();

      var searchAnime = await _animeApi.searchAnime(query);
      _animeList.addAll(searchAnime.data);
    }

    notifyListeners();
  }
}
