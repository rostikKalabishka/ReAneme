import 'package:flutter/material.dart';

import '../../../../domain/anime_api/anime_api.dart';

import '../../../../domain/entity/anime_details/anime_details_entity.dart';

class AnimeDetailsModel extends ChangeNotifier {
  String animeId;

  AnimeDetailsModel(this.animeId);

  AnimeDetailsEntity? _animeEntity;
  AnimeDetailsEntity? get animeEntity => _animeEntity;

  final _animeApi = AnimeApi();

  Future<void> setup() async {
    _animeEntity = await _animeApi.getAnimeDetails(animeId);
    notifyListeners();
  }
}
