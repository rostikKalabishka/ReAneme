import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:re_anime/domain/anime_api/anime_api.dart';

import '../../../../domain/entity/anime/anime_entity.dart';
import '../../../../router/router.dart';

class SearchModel extends ChangeNotifier {
  final _animeApi = AnimeApi();
  int limit = 10;
  var offset = 0;
  final _animeList = <Data>[];
  int count = 0;
  String? _searchQuery;
  Timer? searchDebounce;
  List<Data> get animeList => List.unmodifiable(_animeList);
  bool isLoading = false;

  Future<void> setup() async {
    await clearResults();
  }

  Future<void> clearResults() async {
    offset = 0;
    _animeList.clear();
    await loadAnime(offset);
    isLoading = true;
  }

  Future<void> searchAnime(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 500), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await clearResults();
    });
  }

  Future<void> loadPage(ScrollController controller) async {
    if (isLoading) return;

    isLoading = true;

    await loadAnime(offset);

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (count > limit && isLoading) {
          offset += limit;
          loadAnime(offset);
        }
        isLoading = false;
      }
    });
  }

  void onAnimeTap(BuildContext context, int index) {
    final id = _animeList[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteName.animeDetails, arguments: id);
  }

  Future<void> loadAnime(int offset) async {
    final query = _searchQuery;

    if (query == null) {
      final newItems = await _animeApi.getAnime(limit, offset);

      _animeList.addAll(newItems.data);

      count = newItems.meta.count;
    } else {
      final searchAnime =
          await _animeApi.searchAnime(query.trim(), limit, offset);

      _animeList.addAll(searchAnime.data);

      count = searchAnime.meta.count;
    }

    isLoading = true;
    log('$count');
    notifyListeners();
  }
}
