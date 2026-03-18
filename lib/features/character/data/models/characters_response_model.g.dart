// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResponseModel _$CharactersResponseModelFromJson(
  Map<String, dynamic> json,
) => CharactersResponseModel(
  PageModel.fromJson(json['info'] as Map<String, dynamic>),
  (json['results'] as List<dynamic>)
      .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CharactersResponseModelToJson(
  CharactersResponseModel instance,
) => <String, dynamic>{'info': instance.info, 'results': instance.results};
