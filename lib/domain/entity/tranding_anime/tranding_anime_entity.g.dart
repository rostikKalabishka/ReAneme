// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tranding_anime_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingAnimeEntity _$TrendingAnimeEntityFromJson(Map<String, dynamic> json) =>
    TrendingAnimeEntity(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataTrending.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrendingAnimeEntityToJson(
        TrendingAnimeEntity instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

DataTrending _$DataTrendingFromJson(Map<String, dynamic> json) => DataTrending(
      attributes: AttributesTrending.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataTrendingToJson(DataTrending instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
    };

AttributesTrending _$AttributesTrendingFromJson(Map<String, dynamic> json) =>
    AttributesTrending(
      titles: Titles.fromJson(json['titles'] as Map<String, dynamic>),
      posterImage:
          PosterImage.fromJson(json['posterImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttributesTrendingToJson(AttributesTrending instance) =>
    <String, dynamic>{
      'titles': instance.titles,
      'posterImage': instance.posterImage,
    };

Titles _$TitlesFromJson(Map<String, dynamic> json) => Titles(
      en: json['en'] as String?,
      enJp: json['en_jp'] as String,
      jaJp: json['ja_jp'] as String?,
    );

Map<String, dynamic> _$TitlesToJson(Titles instance) => <String, dynamic>{
      'en': instance.en,
      'en_jp': instance.enJp,
      'ja_jp': instance.jaJp,
    };

PosterImage _$PosterImageFromJson(Map<String, dynamic> json) => PosterImage(
      tiny: json['tiny'] as String,
      small: json['small'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String?,
      original: json['original'] as String?,
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
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
      dimensions:
          Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'dimensions': instance.dimensions,
    };

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) => Dimensions(
      tiny: Tiny.fromJson(json['tiny'] as Map<String, dynamic>),
      small: Small.fromJson(json['small'] as Map<String, dynamic>),
      medium: Medium.fromJson(json['medium'] as Map<String, dynamic>),
      large: Large.fromJson(json['large'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DimensionsToJson(Dimensions instance) =>
    <String, dynamic>{
      'tiny': instance.tiny,
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

Tiny _$TinyFromJson(Map<String, dynamic> json) => Tiny(
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$TinyToJson(Tiny instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

Small _$SmallFromJson(Map<String, dynamic> json) => Small(
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$SmallToJson(Small instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

Medium _$MediumFromJson(Map<String, dynamic> json) => Medium(
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$MediumToJson(Medium instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

Large _$LargeFromJson(Map<String, dynamic> json) => Large(
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$LargeToJson(Large instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
