import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../../../../domain/anime_api/anime_api.dart';
import '../../../../../domain/entity/anime/anime_entity.dart';

class AnimeOngoingModel extends ChangeNotifier {
  final int limit = 20;
  final AnimeApi _animeApi = AnimeApi();
  AnimeEntity? _anime;

  AnimeEntity? get anime => _anime;

  Future<void> setup() async {
    await _loadMovieAnime();
  }

  Future<void> _loadMovieAnime() async {
    _anime = await _animeApi.getStatus(limit, 'current');

    notifyListeners();
  }
}
