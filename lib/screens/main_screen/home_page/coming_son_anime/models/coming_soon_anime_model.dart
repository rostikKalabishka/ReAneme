import 'package:flutter/material.dart';

import '../../../../../domain/anime_api/anime_api.dart';

import '../../../../../domain/entity/tranding_anime/tranding_anime_entity.dart';

class ComingSoonAnimeModel extends ChangeNotifier {
  final _animeApi = AnimeApi();
  TrendingAnimeEntity? _anime;

  TrendingAnimeEntity? get anime => _anime;

  Future<void> setup() async {
    await loadTrendingAnime();
  }

  Future<void> loadTrendingAnime() async {
    _anime = await _animeApi.getTrendingAnime();
    notifyListeners();
  }
}
