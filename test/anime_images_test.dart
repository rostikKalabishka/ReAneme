import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:re_anime/resources/resources.dart';

void main() {
  test('anime_images assets test', () {
    expect(File(AnimeImages.reanime).existsSync(), isTrue);
    expect(File(AnimeImages.small).existsSync(), isTrue);
  });
}
