import 'package:dio/dio.dart';

import '../entity/anime/anime_entity.dart';
import '../entity/tranding_anime/tranding_anime_entity.dart';

class AllUrl {
  static String baseUrl = 'https://kitsu.io/api/edge/anime';
  static String trendingUrl = 'https://kitsu.io/api/edge/trending/anime';
}

class AnimeApi {
  final Dio dio = Dio();

  Future<AnimeEntity> getAnime(
    int limit,
    int offset,
  ) async {
    try {
      final response = await dio.get(
        AllUrl.baseUrl,
        queryParameters: {
          'page[limit]': limit.toString(),
          'page[offset]': offset.toString()
        },
      );

      if (response.statusCode == 200) {
        final json = response.data;

        if (json != null && json is Map<String, dynamic>) {
          final apiResponse = AnimeEntity.fromJson(json);
          return apiResponse;
        } else {
          print('Error: Invalid JSON data');
          throw Exception('Incorrect JSON data');
        }
      } else {
        print('Error: ${response.statusCode}');
        throw Exception(
            'HTTP request failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('There was an error: $e');
      throw Exception(e);
    }
  }

  Future<TrendingAnimeEntity> getTrendingAnime() async {
    try {
      final response = await dio.get(
        AllUrl.trendingUrl,
        // queryParameters: {
        //   'page[limit]': limit.toString(),
        //   'page[offset]': offset.toString()
        // }
      );

      if (response.statusCode == 200) {
        final json = response.data;

        if (json != null && json is Map<String, dynamic>) {
          final apiResponse = TrendingAnimeEntity.fromJson(json);
          return apiResponse;
        } else {
          print('Error: Invalid JSON data');
          throw Exception('Incorrect JSON data');
        }
      } else {
        print('Error: ${response.statusCode}');
        throw Exception(
            'HTTP request failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('There was an error: $e');
      throw e;
    }
  }
}

// class AnimeApi {
//   final Dio dio = Dio();

//   Future<List<AnimeEntity>> getAnime() async {
//     final response = await dio.get('https://kitsu.io/api/edge/anime');
//     final json = response.data;
//     final jsonList = json['data'] as List;

//     final apiResponse = jsonList
//         .map((dynamic e) => AnimeEntity.fromJson(e as Map<String, dynamic>))
//         .toList();

//     return apiResponse;
//   }
// }
