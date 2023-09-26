import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../../../../domain/anime_api/anime_api.dart';
import '../../../../../domain/entity/anime/anime_entity.dart';
import '../../../../../router/router.dart';

class AnimeTVModel extends ChangeNotifier {
  final int limit = 20;
  final AnimeApi _animeApi = AnimeApi();
  AnimeEntity? _anime;

  AnimeEntity? get anime => _anime;

  Future<void> setup() async {
    await _loadAnimeTVModel();
  }

  void onAnimeTap(BuildContext context, int index) {
    final id = _anime?.data[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteName.animeDetails, arguments: id);
  }

  Future<void> _loadAnimeTVModel() async {
    _anime = await _animeApi.getAnimeType(limit, 'TV');

    notifyListeners();
  }
}
