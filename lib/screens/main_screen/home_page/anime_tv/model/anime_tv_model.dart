import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../../../../domain/anime_api/anime_api.dart';
import '../../../../../domain/entity/anime/anime_entity.dart';

// class AnimeMovieModel extends ChangeNotifier {
//   final AnimeApi _animeApi = AnimeApi();
//   final List<Data> _animeList = [];

//   List<Data> get animeList => List.unmodifiable(_animeList);

//   Future<void> setup() async {
//     await _loadMovieAnime();
//   }

//   Future<void> _loadMovieAnime() async {
//     try {
//       final biba = await _animeApi.getAnimeType();
//       final bebrik = biba.data;

//       for (final anime in bebrik) {
//         if (anime.type == 'anime') {
//           _animeList.add(anime);
//         }
//       }

//       notifyListeners();
//     } catch (error) {
//       print('Произошла ошибка при загрузке аниме: $error');
//     }
//   }
// }

class AnimeMovieModel extends ChangeNotifier {
  final int limit = 20;
  final AnimeApi _animeApi = AnimeApi();
  AnimeEntity? _anime;
  final _animeMovieList = [];

  AnimeEntity? get anime => _anime;
  get animeMovieList => _animeMovieList;

  Future<void> setup() async {
    await loadTrendingAnime();
  }

  Future<void> loadTrendingAnime() async {
    final animeResponse = await _animeApi.getAnimeType(limit);
    final bebrik = animeResponse.data;
    _anime = animeResponse;

    var items = bebrik.where((e) => e.attributes.subtype == 'TV').toList();

    _animeMovieList.addAll(items);

    notifyListeners();
  }
}

// class ComingSoonAnimeModel extends ChangeNotifier {
//   final _animeApi = AnimeApi();
//   TrendingAnimeEntity? _anime;

//   TrendingAnimeEntity? get anime => _anime;

//   Future<void> setup() async {
//     await loadTrendingAnime();
//   }

//   Future<void> loadTrendingAnime() async {
//     _anime = await _animeApi.getTrendingAnime();
//     notifyListeners();
//   }
// }