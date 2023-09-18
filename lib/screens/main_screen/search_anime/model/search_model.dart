import 'dart:async';

import 'package:flutter/material.dart';
import 'package:re_anime/domain/anime_api/anime_api.dart';

import '../../../../domain/entity/anime/anime_entity.dart';

class SearchModel extends ChangeNotifier {
  final _animeApi = AnimeApi();
  int limit = 20;
  var offset = 0;
  AnimeEntity? _anime;
  final _animeList = <Data>[];
  String? _searchQuery;
  // AnimeEntity? get anime => _anime;
  Timer? searchDebounce;
  List<Data> get animeList => List.unmodifiable(_animeList);

  Future<void> setup() async {
    await clearResults();
  }

  Future<void> clearResults() async {
    _animeList.clear();
    await loadAnime(offset);
  }

  Future<void> searchAnime(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
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
        clearResults();
      }
    });
  }

  Future<void> loadAnime(int offset) async {
    final query = _searchQuery;
    if (query == null) {
      var newItems = await _animeApi.getAnime(limit, offset);
      _animeList.addAll(newItems.data);
    } else {
      var searchAnime = await _animeApi.searchAnime(query, limit, offset);
      _animeList.addAll(searchAnime.data);
    }

    notifyListeners();
  }
}
