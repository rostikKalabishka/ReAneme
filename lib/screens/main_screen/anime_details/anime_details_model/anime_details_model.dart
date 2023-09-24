import 'package:flutter/material.dart';

import '../../../../domain/anime_api/anime_api.dart';
import '../../../../domain/entity/anime/anime_entity.dart';

class AnimeDetailsModel extends ChangeNotifier {
  String animeId;

  AnimeDetailsModel(this.animeId);

  Data? _animeEntity;
  Data? get animeEntity => _animeEntity;

  final _animeApi = AnimeApi();

  Future<void> setup() async {
    _animeEntity = await _animeApi.getAnimeDetails(0);
    // animeId = _animeEntity!.id!;
  }
}
