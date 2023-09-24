import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../../../../domain/anime_api/anime_api.dart';
import '../../../../../domain/entity/anime/anime_entity.dart';

class AnimeMovieModel extends ChangeNotifier {
  final int limit = 20;
  final AnimeApi _animeApi = AnimeApi();
  AnimeEntity? _anime;
  final _animeMovieList = [];

  AnimeEntity? get anime => _anime;
  get animeMovieList => _animeMovieList;

  Future<void> setup() async {
    await _loadMovieAnime();
  }

  Future<void> _loadMovieAnime() async {
    final animeResponse = await _animeApi.getAnimeType(limit);
    final animeData = animeResponse.data;
    _anime = animeResponse;

    final items =
        animeData.where((e) => e.attributes.subtype == 'movie').toList();

    _animeMovieList.addAll(items);

    notifyListeners();
  }
}
