// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeEntity _$AnimeEntityFromJson(Map<String, dynamic> json) => AnimeEntity(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimeEntityToJson(AnimeEntity instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      type: json['type'] as String,
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'type': instance.type,
      'attributes': instance.attributes,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      titles: Titles.fromJson(json['titles'] as Map<String, dynamic>),
      subtype: json['subtype'] as String,
      posterImage: json['posterImage'] == null
          ? null
          : PosterImage.fromJson(json['posterImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'titles': instance.titles,
      'subtype': instance.subtype,
      'posterImage': instance.posterImage,
    };

Titles _$TitlesFromJson(Map<String, dynamic> json) => Titles(
      en: json['en'] as String?,
      enJp: json['en_jp'] as String?,
      jaJp: json['ja_jp'] as String?,
    );

Map<String, dynamic> _$TitlesToJson(Titles instance) => <String, dynamic>{
      'en': instance.en,
      'en_jp': instance.enJp,
      'ja_jp': instance.jaJp,
    };

PosterImage _$PosterImageFromJson(Map<String, dynamic> json) => PosterImage(
      tiny: json['tiny'] as String?,
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
      original: json['original'] as String?,
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PosterImageToJson(PosterImage instance) =>
    <String, dynamic>{
      'tiny': instance.tiny,
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'original': instance.original,
      'meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      dimensions: json['dimensions'] == null
          ? null
          : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'dimensions': instance.dimensions,
    };

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) => Dimensions(
      tiny: json['tiny'] == null
          ? null
          : Tiny.fromJson(json['tiny'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DimensionsToJson(Dimensions instance) =>
    <String, dynamic>{
      'tiny': instance.tiny,
    };

Tiny _$TinyFromJson(Map<String, dynamic> json) => Tiny(
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$TinyToJson(Tiny instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
