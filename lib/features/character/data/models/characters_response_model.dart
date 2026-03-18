import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/features/character/data/models/character_model.dart';
import 'package:rick_and_morty/features/character/data/models/page_model.dart';

part 'characters_response_model.g.dart';

@JsonSerializable()
class CharactersResponseModel {
  final PageModel info;
  final List<CharacterModel> results;
  const CharactersResponseModel(this.info, this.results);

  factory CharactersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseModelToJson(this);
}
