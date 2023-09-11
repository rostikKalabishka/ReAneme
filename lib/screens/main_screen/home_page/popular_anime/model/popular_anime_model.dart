import 'package:flutter/material.dart';

class PopularAnimeModel extends ChangeNotifier {
  final int id;
  final String name;
  final String imageSmall;

  PopularAnimeModel(
      {required this.id, required this.name, required this.imageSmall});
}
