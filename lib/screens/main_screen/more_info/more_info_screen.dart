import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/anime/anime_entity.dart';
import '../../../widget/text_widget.dart';

class MoreInfoWidget extends StatelessWidget {
  const MoreInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const SafeArea(
        child: ColumnButtonWidget(),
      ),
    );
  }
}

class ColumnButtonWidget extends StatefulWidget {
  const ColumnButtonWidget({super.key});

  @override
  State<ColumnButtonWidget> createState() => _ColumnButtonWidgetState();
}

class _ColumnButtonWidgetState extends State<ColumnButtonWidget> {
  Future<AnimeEntity> biba() async {
    final dio = Dio();
    try {
      final response = await dio.get('https://kitsu.io/api/edge/anime');
      final json = response.data;

      if (json != null && json is Map<String, dynamic>) {
        final apiResponse = AnimeEntity.fromJson(json);
        print(apiResponse);
        return apiResponse;
      } else {
        print('Error: Invalid JSON data');
        throw Exception('Incorrect JSON data');
      }
    } catch (e) {
      print('There was an error: $e');
      throw e; //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {},
              child: const TextWidget(
                label: 'Switch to manga',
              )),
          TextButton(
              onPressed: () {
                biba();
              },
              child: const TextWidget(
                label: 'Logout',
              ))
        ],
      ),
    );
  }
}
