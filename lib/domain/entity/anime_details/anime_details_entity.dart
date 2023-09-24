import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'anime_details_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeDetailsEntity {
  final Data data;
  AnimeDetailsEntity({
    required this.data,
  });
  factory AnimeDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeDetailsEntityToJson(this);
}

@JsonSerializable()
class Data {
  final String id;
  final String type;
  // final Links links;
  final Attributes attributes;
  // final Relationships relationships;
  Data({
    required this.id,
    required this.type,
    // required this.links,
    required this.attributes,
    // required this.relationships,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

// @JsonSerializable()
// class Links {
//   final String self;
//   Links({
//     required this.self,
//   });
// }

@JsonSerializable()
class Attributes {
  // final String createdAt;
  // final String updatedAt;
  // final String slug;
  // final String synopsis;
  // final String description;
  // final int coverImageTopOffset;
  final Titles titles;
  // final String canonicalTitle;
  // final List<String> abbreviatedTitles;
  // final String averageRating;
  // final RatingFrequencies ratingFrequencies;
  // final int userCount;
  // final int favoritesCount;
  // final String startDate;
  // final String endDate;
  // final NextRelease nextRelease;
  // final int popularityRank;
  // final int ratingRank;
  // final String ageRating;
  // final String ageRatingGuide;
  // final String subtype;
  // final String status;
  // final Tba tba;
  // final PosterImage posterImage;
  // final CoverImage coverImage;
  // final int episodeCount;
  // final int episodeLength;
  // final int totalLength;
  // final String youtubeVideoId;
  // final String showType;
  // final bool nsfw;
  Attributes({
    // required this.createdAt,
    // required this.updatedAt,
    // required this.slug,
    // required this.synopsis,
    // required this.description,
    // required this.coverImageTopOffset,
    required this.titles,
    // required this.canonicalTitle,
    // required this.abbreviatedTitles,
    // required this.averageRating,
    // required this.ratingFrequencies,
    // required this.userCount,
    // required this.favoritesCount,
    // required this.startDate,
    // required this.endDate,
    // required this.nextRelease,
    // required this.popularityRank,
    // required this.ratingRank,
    // required this.ageRating,
    // required this.ageRatingGuide,
    // required this.subtype,
    // required this.status,
    // required this.tba,
    // required this.posterImage,
    // required this.coverImage,
    // required this.episodeCount,
    // required this.episodeLength,
    // required this.totalLength,
    // required this.youtubeVideoId,
    // required this.showType,
    // required this.nsfw,
  });
  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Titles {
  final String? en;
  @JsonKey(name: 'en_jp')
  final String enJp;
  @JsonKey(name: 'ja_jp')
  final String? jaJp;
  Titles({
    required this.en,
    required this.enJp,
    required this.jaJp,
  });
  factory Titles.fromJson(Map<String, dynamic> json) => _$TitlesFromJson(json);
  Map<String, dynamic> toJson() => _$TitlesToJson(this);
}

// class RatingFrequencies {
//   final String n2;
//   final String n3;
//   final String n4;
//   final String n5;
//   final String n6;
//   final String n7;
//   final String n8;
//   final String n9;
//   final String n10;
//   final String n11;
//   final String n12;
//   final String n13;
//   final String n14;
//   final String n15;
//   final String n16;
//   final String n17;
//   final String n18;
//   final String n19;
//   final String n20;
//   RatingFrequencies({
//     required this.n2,
//     required this.n3,
//     required this.n4,
//     required this.n5,
//     required this.n6,
//     required this.n7,
//     required this.n8,
//     required this.n9,
//     required this.n10,
//     required this.n11,
//     required this.n12,
//     required this.n13,
//     required this.n14,
//     required this.n15,
//     required this.n16,
//     required this.n17,
//     required this.n18,
//     required this.n19,
//     required this.n20,
//   });
// }

// class NextRelease {}

// class Tba {}

// class PosterImage {
//   final String tiny;
//   final String large;
//   final String small;
//   final String medium;
//   final String original;
//   final Meta meta;
//   PosterImage({
//     required this.tiny,
//     required this.large,
//     required this.small,
//     required this.medium,
//     required this.original,
//     required this.meta,
//   });

// }

// class Meta {
//   final Dimensions dimensions;
//   Meta({
//     required this.dimensions,
//   });

  
// }

// class Dimensions {
//   final Tiny tiny;
//   final Large large;
//   final Small small;
//   final Medium medium;
//   Dimensions({
//     required this.tiny,
//     required this.large,
//     required this.small,
//     required this.medium,
//   });

  
// }

// class Tiny {
//   final int width;
//   final int height;
//   Tiny({
//     required this.width,
//     required this.height,
//   });

// }

// class Large {
//   final int width;
//   final int height;
//   Large({
//     required this.width,
//     required this.height,
//   });

// }

// class Small {
//   final int width;
//   final int height;
//   Small({
//     required this.width,
//     required this.height,
//   });

 
// }

// class Medium {
//   final int width;
//   final int height;
//   Medium({
//     required this.width,
//     required this.height,
//   });

  
// }

// class CoverImage {
//   final String tiny;
//   final String large;
//   final String small;
//   final String original;
//   final Meta meta;
//   CoverImage({
//     required this.tiny,
//     required this.large,
//     required this.small,
//     required this.original,
//     required this.meta,
//   });

  
// }

// class Dimensions {
//   final Tiny tiny;
//   final Large large;
//   final Small small;
//   Dimensions({
//     required this.tiny,
//     required this.large,
//     required this.small,
//   });

  
// }

// class Relationships {
//   final Genres genres;
//   final Categories categories;
//   final Castings castings;
//   final Installments installments;
//   final Mappings mappings;
//   final Reviews reviews;
//   final MediaRelationships mediaRelationships;
//   final Characters characters;
//   final Staff staff;
//   final Productions productions;
//   final Quotes quotes;
//   final Episodes episodes;
//   final StreamingLinks streamingLinks;
//   final AnimeProductions animeProductions;
//   final AnimeCharacters animeCharacters;
//   final AnimeStaff animeStaff;
//   Relationships({
//     required this.genres,
//     required this.categories,
//     required this.castings,
//     required this.installments,
//     required this.mappings,
//     required this.reviews,
//     required this.mediaRelationships,
//     required this.characters,
//     required this.staff,
//     required this.productions,
//     required this.quotes,
//     required this.episodes,
//     required this.streamingLinks,
//     required this.animeProductions,
//     required this.animeCharacters,
//     required this.animeStaff,
//   });

  
// }

// class Genres {
//   final Links links;
//   Genres({
//     required this.links,
//   });

  
// }

// class Links {
//   final String self;
//   final String related;
//   Links({
//     required this.self,
//     required this.related,
//   });

  
// }

// class Categories {
//   final Links links;
//   Categories({
//     required this.links,
//   });

  
// }

// class Castings {
//   final Links links;
//   Castings({
//     required this.links,
//   });

  
// }

// class Installments {
//   final Links links;
//   Installments({
//     required this.links,
//   });

  
// }

// class Mappings {
//   final Links links;
//   Mappings({
//     required this.links,
//   });

  
// }

// class Reviews {
//   final Links links;
//   Reviews({
//     required this.links,
//   });

  
// }

// class MediaRelationships {
//   final Links links;
//   MediaRelationships({
//     required this.links,
//   });

  
// }

// class Characters {
//   final Links links;
//   Characters({
//     required this.links,
//   });

  
// }

// class Staff {
//   final Links links;
//   Staff({
//     required this.links,
//   });
// }

// class Productions {
//   final Links links;
//   Productions({
//     required this.links,
//   });
// }

// class Quotes {
//   final Links links;
//   Quotes({
//     required this.links,
//   });
// }

// class Episodes {
//   final Links links;
//   Episodes({
//     required this.links,
//   });
// }

// class StreamingLinks {
//   final Links links;
//   StreamingLinks({
//     required this.links,
//   });
// }

// class AnimeProductions {
//   final Links links;
//   AnimeProductions({
//     required this.links,
//   });
// }

// class AnimeCharacters {
//   final Links links;
//   AnimeCharacters({
//     required this.links,
//   });
// }

// class AnimeStaff {
//   final Links links;
//   AnimeStaff({
//     required this.links,
//   });
// }
