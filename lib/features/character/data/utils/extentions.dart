import 'package:rick_and_morty/features/character/data/models/character_model.dart';
import 'package:rick_and_morty/features/character/data/models/characters_response_model.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';
import 'package:rick_and_morty/features/character/domain/entities/page.dart';

extension CharactersResponseModelExtentions on CharactersResponseModel {
  Page toDomain() =>
      Page(characters: results.toDomains(), next: info.next, prev: info.prev);
}

extension CharacterModelsExtentions on List<CharacterModel> {
  List<Character> toDomains() => map((model) => model.toDomain()).toList();
}

extension CharacterModelExtentions on CharacterModel {
  Character toDomain() => Character(
    name: name,
    status: status,
    species: species,
    image: image,
    lastKnownLocation: location.name,
    firstSeenIn: episode[0].name,
  );
}
