import 'package:rick_and_morty/features/character/domain/entities/page.dart';

abstract class ICharactersRepository {
  Future<Page> getCharacters(int page);
}
