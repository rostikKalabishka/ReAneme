import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_anime/screens/main_screen/search_anime/model/search_model.dart';

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
  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchModel>();
    // final anime = model.anime?.data[0].attributes.titles.en;
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
              onPressed: () {},
              child: const TextWidget(
                label: 'Logout',
              ))
        ],
      ),
    );
  }
}
