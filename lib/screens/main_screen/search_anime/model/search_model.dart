import 'dart:async';

import 'package:flutter/material.dart';
import 'package:re_anime/domain/anime_api/anime_api.dart';

import '../../../../domain/entity/anime/anime_entity.dart';

class SearchModel extends ChangeNotifier {
  final _animeApi = AnimeApi();
  int limit = 10;
  var offset = 0;
  AnimeEntity? _anime;
  final _animeList = <Data>[];
  String? _searchQuery;
  Timer? searchDebounce;
  List<Data> get animeList => List.unmodifiable(_animeList);
  bool isLoading = false;

  Future<void> setup() async {
    await clearResults();
  }

  Future<void> clearResults() async {
    offset = 0;
    _animeList.clear();
    await loadAnime(offset);
    isLoading = true;
    // notifyListeners();
  }

  Future<void> searchAnime(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 500), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await clearResults();
    });
  }

  Future<void> loadPage(ScrollController controller) async {
    if (isLoading) return;
    isLoading = true;

    await loadAnime(offset);
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        print(offset);
        // _animeList.clear();
        if (isLoading) {
          offset += 20;
        } else {
          offset += 0;
        }
        loadAnime(offset);
      }
    });
  }

  Future<void> loadAnime(int offset) async {
    final query = _searchQuery;

    if (query == null) {
      print('biba');
      final newItems = await _animeApi.getAnime(limit, offset);
      _animeList.addAll(newItems.data);
    } else {
      print('fetch');
      final searchAnime = await _animeApi.searchAnime(query, limit, offset);
      // offset = 0;
      _animeList.addAll(searchAnime.data);
    }

    isLoading = true;
    notifyListeners();
  }
}


// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:re_anime/domain/anime_api/anime_api.dart';

// import '../../../../domain/entity/anime/anime_entity.dart';

// class SearchModel extends ChangeNotifier {
//   final _animeApi = AnimeApi();
//   int limit = 10;
//   var offset = 0;
//   AnimeEntity? _anime;
//   final _animeList = <Data>[];
//   String? _searchQuery;
//   Timer? searchDebounce;
//   List<Data> get animeList => List.unmodifiable(_animeList);
//   bool isLoading = false;

//   Future<void> setup() async {
//     await clearResults();
//   }

//   Future<void> clearResults() async {
//     offset = 0;
//     _animeList.clear();
//     await loadAnime(offset);
//     isLoading = true;
//     // Не вызывайте notifyListeners() здесь
//   }

//   Future<void> searchAnime(String text) async {
//     searchDebounce?.cancel();
//     searchDebounce = Timer(const Duration(milliseconds: 300), () async {
//       final searchQuery = text.isNotEmpty ? text : null;
//       if (_searchQuery == searchQuery) return;
//       _searchQuery = searchQuery;
//       await clearResults();
//     });
//   }

//   Future<void> loadPage(ScrollController controller) async {
//     if (isLoading) return;
//     isLoading = true;

//     await loadAnime(offset);
//     controller.addListener(() {
//       if (controller.position.pixels == controller.position.maxScrollExtent) {
//         print(offset);
//         offset += limit;
//         loadAnime(offset);
//       }
//     });
//   }

//   Future<void> loadAnime(int offset) async {
//     final query = _searchQuery;

//     if (query == null) {
//       var newItems = await _animeApi.getAnime(limit, offset);
//       _animeList
//           .addAll(newItems.data); // Добавляем новые элементы к текущему списку
//     } else {
//       var searchAnime = await _animeApi.searchAnime(query, limit, offset);
//       _animeList.addAll(
//           searchAnime.data); // Добавляем новые элементы к текущему списку
//     }

//     isLoading =
//         false; // Устанавливаем isLoading в false, так как загрузка завершена
//     notifyListeners(); // Уведомляем слушателей об изменениях
//   }
// }
