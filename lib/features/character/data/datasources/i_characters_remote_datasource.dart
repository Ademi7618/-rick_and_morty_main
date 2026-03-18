import 'package:rick_and_morty/features/character/data/models/characters_response_model.dart';

abstract class ICharactersRemoteDatasource {
  Future<CharactersResponseModel> getCharacters(int page);
}
