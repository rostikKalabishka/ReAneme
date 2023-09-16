import 'package:dio/dio.dart';

import '../entity/anime/anime_entity.dart';

class AnimeApi {
  final Dio dio = Dio();

  // Future<AnimeEntity> getAnime() async {
  //   try {
  //     final response = await dio.get('https://kitsu.io/api/edge/anime');
  //     final json = await response.data;

  //     if (json != null && json is Map<String, dynamic>) {
  //       final apiResponse = AnimeEntity.fromJson(json);

  //       return apiResponse;
  //     } else {
  //       print('Error: Invalid JSON data');
  //       throw Exception('Incorrect JSON data');
  //     }
  //   } catch (e) {
  //     print('There was an error: $e');
  //     throw e;
  //   }
  // }

  Future<AnimeEntity> biba() async {
    try {
      final response = await dio.get('https://kitsu.io/api/edge/anime');

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
