import 'package:flutter/material.dart';

import '../../../../../domain/anime_api/anime_api.dart';

import '../../../../../domain/entity/tranding_anime/tranding_anime_entity.dart';
import '../../../../../router/router.dart';

class ComingSoonAnimeModel extends ChangeNotifier {
  final _animeApi = AnimeApi();
  TrendingAnimeEntity? _anime;

  TrendingAnimeEntity? get anime => _anime;

  Future<void> setup() async {
    await loadTrendingAnime();
  }

  void onAnimeTap(BuildContext context, int index) {
    final id = _anime?.data[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteName.animeDetails, arguments: id);
  }

  Future<void> loadTrendingAnime() async {
    _anime = await _animeApi.getTrendingAnime();
    notifyListeners();
  }
}
