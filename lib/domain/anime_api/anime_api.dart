import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../entity/anime/anime_entity.dart';
import '../entity/anime_details/anime_details_entity.dart';
import '../entity/tranding_anime/tranding_anime_entity.dart';

class AllUrl {
  static String baseUrl = 'https://kitsu.io/api/edge';
  static String trendingUrl = '$baseUrl/trending/anime';
  static String searchUrl = '$baseUrl/anime';
}

class AnimeApi {
  final Dio dio = Dio();

  Future<AnimeEntity> getAnimeType(
    int limit,
    String subtype,
  ) async {
    final finalUrl = '${AllUrl.baseUrl}/anime';
    try {
      final response = await dio.get(
        finalUrl,
        queryParameters: {
          'page[limit]': limit.toString(),
          'filter[subtype]': subtype,
        },
      );

      if (response.statusCode == 200) {
        final json = response.data;

        if (json != null && json is Map<String, dynamic>) {
          final apiResponse = AnimeEntity.fromJson(json);

          return apiResponse;
        } else {
          log('Error: Invalid JSON data');
          throw Exception('Incorrect JSON data');
        }
      } else {
        log('Error: ${response.statusCode}');
        throw Exception(
            'HTTP request failed with status ${response.statusCode}');
      }
    } catch (e) {
      log('There was an error: $e');
      throw Exception(e);
    }
  }

  Future<AnimeEntity> getStatus(int limit, String current) async {
    final finalUrl = '${AllUrl.baseUrl}/anime';
    try {
      final response = await dio.get(
        finalUrl,
        queryParameters: {
          'page[limit]': limit.toString(),
          'filter[status]': current
        },
      );

      if (response.statusCode == 200) {
        final json = response.data;

        if (json != null && json is Map<String, dynamic>) {
          final apiResponse = AnimeEntity.fromJson(json);

          return apiResponse;
        } else {
          log('Error: Invalid JSON data');
          throw Exception('Incorrect JSON data');
        }
      } else {
        log('Error: ${response.statusCode}');
        throw Exception(
            'HTTP request failed with status ${response.statusCode}');
      }
    } catch (e) {
      log('There was an error: $e');
      throw Exception(e);
    }
  }

  Future<AnimeEntity> searchAnime(
    String text,
    int limit,
    int offset,
  ) async {
    final finalUrl = '${AllUrl.baseUrl}/anime';
    try {
      final response = await dio.get(
        finalUrl,
        queryParameters: {
          'filter[text]': text,
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
          log('Error: Invalid JSON data');
          throw Exception('Incorrect JSON data');
        }
      } else {
        log('Error: ${response.statusCode}');
        throw Exception(
            'HTTP request failed with status ${response.statusCode}');
      }
    } catch (e) {
      log('There was an error: $e');
      throw Exception(e);
    }
  }

  Future<AnimeEntity> getAnime(
    int limit,
    int offset,
  ) async {
    final finalUrl = '${AllUrl.baseUrl}/anime';
    try {
      final response = await dio.get(
        finalUrl,
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
          log('Error: Invalid JSON data');
          throw Exception('Incorrect JSON data');
        }
      } else {
        log('Error: ${response.statusCode}');
        throw Exception(
            'HTTP request failed with status ${response.statusCode}');
      }
    } on NetworkImageLoadException {
      log('NetworkImageLoadException');
      throw Exception;
    } catch (e) {
      log('There was an error: $e');
      throw Exception(e);
    }
  }

  Future<AnimeDetailsEntity> getAnimeDetails(String animeId) async {
    final finalUrl = '${AllUrl.baseUrl}/anime/$animeId';
    try {
      final response = await dio.get(
        finalUrl,
        // queryParameters: {'page[offset]': offset.toString()},
      );

      if (response.statusCode == 200) {
        final json = response.data;

        if (json != null) {
          final apiResponse = AnimeDetailsEntity.fromJson(json);

          return apiResponse;
        } else {
          log('Error: Invalid JSON data');
          throw Exception('Incorrect JSON data');
        }
      } else {
        log('Error: ${response.statusCode}');
        throw Exception(
            'HTTP request failed with status ${response.statusCode}');
      }
    } catch (e) {
      log('There was an error: $e');
      throw Exception(e);
    }
  }

  Future<TrendingAnimeEntity> getTrendingAnime() async {
    try {
      final response = await dio.get(
        AllUrl.trendingUrl,
      );

      if (response.statusCode == 200) {
        final json = response.data;

        if (json != null && json is Map<String, dynamic>) {
          final apiResponse = TrendingAnimeEntity.fromJson(json);
          return apiResponse;
        } else {
          log('Error: Invalid JSON data');
          throw Exception('Incorrect JSON data');
        }
      } else {
        log('Error: ${response.statusCode}');
        throw Exception(
            'HTTP request failed with status ${response.statusCode}');
      }
    } catch (e) {
      log('There was an error: $e');
      throw e;
    }
  }
}
