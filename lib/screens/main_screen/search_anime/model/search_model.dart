import 'package:flutter/material.dart';
import 'package:re_anime/domain/anime_api/anime_api.dart';

import '../../../../domain/entity/anime/anime_entity.dart';

class SearchModel extends ChangeNotifier {
  final _animeApi = AnimeApi();

  AnimeEntity? _anime;

  AnimeEntity? get anime => _anime;

  Future<void> loadAnime() async {
    _anime = await _animeApi.biba();
    notifyListeners();
  }
}
