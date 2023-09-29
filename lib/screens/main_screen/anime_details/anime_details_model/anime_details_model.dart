import 'package:flutter/material.dart';

import '../../../../domain/anime_api/anime_api.dart';

import '../../../../domain/entity/anime_details/anime_details_entity.dart';
import 'package:intl/intl.dart';

class AnimeDetailsModel extends ChangeNotifier {
  String animeId;

  AnimeDetailsModel(this.animeId);
  late DateFormat _dateFormat;
  AnimeDetailsEntity? _animeEntity;
  AnimeDetailsEntity? get animeEntity => _animeEntity;
  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  final _animeApi = AnimeApi();

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setup() async {
    _animeEntity = await _animeApi.getAnimeDetails(animeId);
    _dateFormat = DateFormat.yMMMEd();
    _isFavorite = await _animeApi.checkIsFavoriteInList(animeId);
    notifyListeners();
  }

  Future<void> toggleAnimeFavorite() async {
    _isFavorite = await _animeApi.checkIsFavoriteInList(animeId);

    if (_isFavorite == true) {
      await _animeApi.removeFavoriteAnime(animeId);
    } else if (_isFavorite == false) {
      await _animeApi.addFavoriteAnime(animeId);
    }

    _isFavorite = !_isFavorite;

    notifyListeners();
  }
}
