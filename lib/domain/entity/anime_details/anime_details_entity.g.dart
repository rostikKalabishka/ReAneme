// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDetailsEntity _$AnimeDetailsEntityFromJson(Map<String, dynamic> json) =>
    AnimeDetailsEntity(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDetailsEntityToJson(AnimeDetailsEntity instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      type: json['type'] as String,
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      createdAt: parseMovieDateFromString(json['createdAt'] as String?),
      description: json['description'] as String,
      titles: Titles.fromJson(json['titles'] as Map<String, dynamic>),
      averageRating: json['averageRating'] as String,
      userCount: json['userCount'] as int,
      startDate: json['startDate'] as String?,
      ageRating: json['ageRating'] as String?,
      status: json['status'] as String?,
      posterImage:
          PosterImage.fromJson(json['posterImage'] as Map<String, dynamic>),
      coverImage: json['coverImage'] == null
          ? null
          : CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      episodeCount: json['episodeCount'] as int?,
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'description': instance.description,
      'titles': instance.titles,
      'averageRating': instance.averageRating,
      'userCount': instance.userCount,
      'startDate': instance.startDate,
      'ageRating': instance.ageRating,
      'status': instance.status,
      'posterImage': instance.posterImage,
      'coverImage': instance.coverImage,
      'episodeCount': instance.episodeCount,
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
      tiny: json['tiny'] as String?,
      large: json['large'] as String?,
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PosterImageToJson(PosterImage instance) =>
    <String, dynamic>{
      'tiny': instance.tiny,
      'large': instance.large,
      'small': instance.small,
      'medium': instance.medium,
      'meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      dimensions: DimensionsCoverImage.fromJson(
          json['dimensions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'dimensions': instance.dimensions,
    };

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) => Dimensions(
      tiny: json['tiny'] == null
          ? null
          : Tiny.fromJson(json['tiny'] as Map<String, dynamic>),
      large: json['large'] == null
          ? null
          : Large.fromJson(json['large'] as Map<String, dynamic>),
      small: json['small'] == null
          ? null
          : Small.fromJson(json['small'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : Medium.fromJson(json['medium'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DimensionsToJson(Dimensions instance) =>
    <String, dynamic>{
      'tiny': instance.tiny,
      'large': instance.large,
      'small': instance.small,
      'medium': instance.medium,
    };

Tiny _$TinyFromJson(Map<String, dynamic> json) => Tiny(
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$TinyToJson(Tiny instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

Large _$LargeFromJson(Map<String, dynamic> json) => Large(
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$LargeToJson(Large instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

Small _$SmallFromJson(Map<String, dynamic> json) => Small(
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$SmallToJson(Small instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

Medium _$MediumFromJson(Map<String, dynamic> json) => Medium(
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$MediumToJson(Medium instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

CoverImage _$CoverImageFromJson(Map<String, dynamic> json) => CoverImage(
      tiny: json['tiny'] as String?,
      large: json['large'] as String?,
      small: json['small'] as String?,
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoverImageToJson(CoverImage instance) =>
    <String, dynamic>{
      'tiny': instance.tiny,
      'large': instance.large,
      'small': instance.small,
      'meta': instance.meta,
    };

DimensionsCoverImage _$DimensionsCoverImageFromJson(
        Map<String, dynamic> json) =>
    DimensionsCoverImage(
      tiny: Tiny.fromJson(json['tiny'] as Map<String, dynamic>),
      large: Large.fromJson(json['large'] as Map<String, dynamic>),
      small: Small.fromJson(json['small'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DimensionsCoverImageToJson(
        DimensionsCoverImage instance) =>
    <String, dynamic>{
      'tiny': instance.tiny,
      'large': instance.large,
      'small': instance.small,
    };
