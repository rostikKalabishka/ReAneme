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
      titles: Titles.fromJson(json['titles'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'titles': instance.titles,
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
