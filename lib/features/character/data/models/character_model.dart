import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final String name;
  final String status;
  final String species;
  final String image;
  final LocationModel location;
  final List<EpisodeModel> episode;

  const CharacterModel({
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.location,
    required this.episode,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonSerializable()
class LocationModel {
  final String name;
  const LocationModel(this.name);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class EpisodeModel {
  final String name;
  const EpisodeModel(this.name);

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
