import 'package:json_annotation/json_annotation.dart';

part 'anime_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeEntity {
  final List<Data> data;
  // final Meta meta;
  // final Links links;
  AnimeEntity({
    required this.data,
    // required this.meta,
    // required this.links,
  });
  factory AnimeEntity.fromJson(Map<String, dynamic> json) =>
      _$AnimeEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeEntityToJson(this);
}

@JsonSerializable()
class Data {
  // final String id;
  // final String type;
  // final Links links;
  final Attributes attributes;
  // final Relationships relationships;
  Data({
    // required this.id,
    // required this.type,
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
//   factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
//   Map<String, dynamic> toJson() => _$LinksToJson(this);
// }

@JsonSerializable()
class Attributes {
  // final String createdAt;
  // final String updatedAt;
  // final String slug;
  // final String synopsis;
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
  // final int popularityRank;
  // final int ratingRank;
  // final String ageRating;
  // final String ageRatingGuide;
  // final String subtype;
  // final String status;
  // final String tba;
  final PosterImage posterImage;
  // final CoverImage coverImage;
  // final int episodeCount;
  // final int episodeLength;
  // final String youtubeVideoId;
  // final String showType;
  // final bool nsfw;
  Attributes({
    // required this.createdAt,
    // required this.updatedAt,
    // required this.slug,
    // required this.synopsis,
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
    // required this.popularityRank,
    // required this.ratingRank,
    // required this.ageRating,
    // required this.ageRatingGuide,
    // required this.subtype,
    // required this.status,
    // required this.tba,
    required this.posterImage,
    // required this.coverImage,
    // required this.episodeCount,
    // required this.episodeLength,
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
  final String? enJp;
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
@JsonSerializable()
class PosterImage {
  final String? tiny;
  final String? small;
  final String? medium;
  final String? large;
  final String? original;
  final Meta meta;
  PosterImage({
    required this.tiny,
    required this.small,
    required this.medium,
    required this.large,
    required this.original,
    required this.meta,
  });
  factory PosterImage.fromJson(Map<String, dynamic> json) =>
      _$PosterImageFromJson(json);
  Map<String, dynamic> toJson() => _$PosterImageToJson(this);
}

@JsonSerializable()
class Meta {
  final Dimensions dimensions;
  Meta({
    required this.dimensions,
  });
  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Dimensions {
  final Tiny tiny;
  // final Small small;
  // final Medium medium;
  // final Large large;
  Dimensions({
    required this.tiny,
    // required this.small,
    // required this.medium,
    // required this.large,
  });
  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}

@JsonSerializable()
class Tiny {
  final int? width;
  final int? height;
  Tiny({
    required this.width,
    required this.height,
  });
  factory Tiny.fromJson(Map<String, dynamic> json) => _$TinyFromJson(json);
  Map<String, dynamic> toJson() => _$TinyToJson(this);
}

// @JsonSerializable()
// class Width {
//   factory Width.fromJson(Map<String, dynamic> json) => _$WidthFromJson(json);
//   Map<String, dynamic> toJson() => _$WidthToJson(this);
// }

// @JsonSerializable()
// class Height {
//   factory Height.fromJson(Map<String, dynamic> json) => _$HeightFromJson(json);
//   Map<String, dynamic> toJson() => _$HeightToJson(this);
// }

// @JsonSerializable()
// class Small {
//   final int width;
//   final int height;
//   Small({
//     required this.width,
//     required this.height,
//   });
//   factory Small.fromJson(Map<String, dynamic> json) => _$SmallFromJson(json);
//   Map<String, dynamic> toJson() => _$SmallToJson(this);
// }

// @JsonSerializable()
// class Medium {
//   final int width;
//   final int height;
//   Medium({
//     required this.width,
//     required this.height,
//   });
//   factory Medium.fromJson(Map<String, dynamic> json) => _$MediumFromJson(json);
//   Map<String, dynamic> toJson() => _$MediumToJson(this);
// }

// @JsonSerializable()
// class Large {
//   final int width;
//   final int height;
//   Large({
//     required this.width,
//     required this.height,
//   });
//   factory Large.fromJson(Map<String, dynamic> json) => _$LargeFromJson(json);
//   Map<String, dynamic> toJson() => _$LargeToJson(this);
// }

// @JsonSerializable()
// class CoverImage {
//   final String tiny;
//   final String small;
//   final String large;
//   final String original;
//   // final Meta meta;
//   CoverImage({
//     required this.tiny,
//     required this.small,
//     required this.large,
//     required this.original,
//     // required this.meta,
//   });
//   factory CoverImage.fromJson(Map<String, dynamic> json) =>
//       _$CoverImageFromJson(json);
//   Map<String, dynamic> toJson() => _$CoverImageToJson(this);
// }

// class Dimensions {
//   final Tiny tiny;
//   final Small small;
//   final Large large;
//   Dimensions({
//     required this.tiny,
//     required this.small,
//     required this.large,
//   });
// // }
// @JsonSerializable()
// class Relationships {
//   final Genres genres;
//   final Categories categories;
//   final Castings castings;
//   final Installments installments;
//   final Mappings mappings;
//   final Reviews reviews;
//   final MediaRelationships mediaRelationships;
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
//     required this.episodes,
//     required this.streamingLinks,
//     required this.animeProductions,
//     required this.animeCharacters,
//     required this.animeStaff,
//   });
//   factory Relationships.fromJson(Map<String, dynamic> json) =>
//       _$RelationshipsFromJson(json);
//   Map<String, dynamic> toJson() => _$RelationshipsToJson(this);
// }

// @JsonSerializable()
// class Genres {
//   final Links links;
//   Genres({
//     required this.links,
//   });
//   factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
//   Map<String, dynamic> toJson() => _$GenresToJson(this);
// }

// class Links {
//   final String self;
//   final String related;
//   Links({
//     required this.self,
//     required this.related,
//   });
// }
// @JsonSerializable()
// class Categories {
//   final Links links;
//   Categories({
//     required this.links,
//   });
//   factory Categories.fromJson(Map<String, dynamic> json) =>
//       _$CategoriesFromJson(json);
//   Map<String, dynamic> toJson() => _$CategoriesToJson(this);
// }

// @JsonSerializable()
// class Castings {
//   final Links links;
//   Castings({
//     required this.links,
//   });
//   factory Castings.fromJson(Map<String, dynamic> json) =>
//       _$CastingsFromJson(json);
//   Map<String, dynamic> toJson() => _$CastingsToJson(this);
// }

// @JsonSerializable()
// class Installments {
//   final Links links;
//   Installments({
//     required this.links,
//   });
//   factory Installments.fromJson(Map<String, dynamic> json) =>
//       _$InstallmentsFromJson(json);
//   Map<String, dynamic> toJson() => _$InstallmentsToJson(this);
// }

// @JsonSerializable()
// class Mappings {
//   final Links links;
//   Mappings({
//     required this.links,
//   });
//   factory Mappings.fromJson(Map<String, dynamic> json) =>
//       _$MappingsFromJson(json);
//   Map<String, dynamic> toJson() => _$MappingsToJson(this);
// }

// @JsonSerializable()
// class Reviews {
//   final Links links;
//   Reviews({
//     required this.links,
//   });
//   factory Reviews.fromJson(Map<String, dynamic> json) =>
//       _$ReviewsFromJson(json);
//   Map<String, dynamic> toJson() => _$ReviewsToJson(this);
// }

// @JsonSerializable()
// class MediaRelationships {
//   final Links links;
//   MediaRelationships({
//     required this.links,
//   });
//   factory MediaRelationships.fromJson(Map<String, dynamic> json) =>
//       _$MediaRelationshipsFromJson(json);
//   Map<String, dynamic> toJson() => _$MediaRelationshipsToJson(this);
// }

// @JsonSerializable()
// class Episodes {
//   final Links links;
//   Episodes({
//     required this.links,
//   });
//   factory Episodes.fromJson(Map<String, dynamic> json) =>
//       _$EpisodesFromJson(json);
//   Map<String, dynamic> toJson() => _$EpisodesToJson(this);
// }

// @JsonSerializable()
// class StreamingLinks {
//   final Links links;
//   StreamingLinks({
//     required this.links,
//   });
//   factory StreamingLinks.fromJson(Map<String, dynamic> json) =>
//       _$StreamingLinksFromJson(json);
//   Map<String, dynamic> toJson() => _$StreamingLinksToJson(this);
// }

// @JsonSerializable()
// class AnimeProductions {
//   final Links links;
//   AnimeProductions({
//     required this.links,
//   });
//   factory AnimeProductions.fromJson(Map<String, dynamic> json) =>
//       _$AnimeProductionsFromJson(json);
//   Map<String, dynamic> toJson() => _$AnimeProductionsToJson(this);
// }

// @JsonSerializable()
// class AnimeCharacters {
//   final Links links;
//   AnimeCharacters({
//     required this.links,
//   });
//   factory AnimeCharacters.fromJson(Map<String, dynamic> json) =>
//       _$AnimeCharactersFromJson(json);
//   Map<String, dynamic> toJson() => _$AnimeCharactersToJson(this);
// }

// @JsonSerializable()
// class AnimeStaff {
//   final Links links;
//   AnimeStaff({
//     required this.links,
//   });
//   factory AnimeStaff.fromJson(Map<String, dynamic> json) =>
//       _$AnimeStaffFromJson(json);
//   Map<String, dynamic> toJson() => _$AnimeStaffToJson(this);
// }

// class Meta {
//   final int count;
//   Meta({
//     required this.count,
//   });

// }

// @JsonSerializable()
// class Links {
//   final String first;
//   final String prev;
//   final String next;
//   final String last;
//   Links({
//     required this.first,
//     required this.prev,
//     required this.next,
//     required this.last,
//   });

//   factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
//   Map<String, dynamic> toJson() => _$LinksToJson(this);
// }
