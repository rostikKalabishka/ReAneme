import 'package:flutter/material.dart';
import 'package:re_anime/domain/anime_api/anime_api.dart';

import '../../../../domain/entity/anime/anime_entity.dart';

class SearchModel extends ChangeNotifier {
  final _animeApi = AnimeApi();
  int limit = 20;
  int offset = 0;
  AnimeEntity? _anime;

  AnimeEntity? get anime => _anime;

  Future<void> setup() async {
    await loadAnime();
    notifyListeners();
  }

  Future<void> loadAnime() async {
    _anime = await _animeApi.getAnime(limit, offset);
    notifyListeners();
  }
}
