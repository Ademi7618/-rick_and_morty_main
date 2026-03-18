import 'package:rick_and_morty/features/character/data/datasources/i_characters_remote_datasource.dart';
import 'package:rick_and_morty/features/character/data/utils/extentions.dart';
import 'package:rick_and_morty/features/character/domain/entities/page.dart';
import 'package:rick_and_morty/features/character/domain/repositories/i_characters_repository.dart';

class CharactersRepository implements ICharactersRepository {
  final ICharactersRemoteDatasource charactersRemoteDatasource;
  const CharactersRepository(this.charactersRemoteDatasource);

  @override
  Future<Page> getCharacters(int page) async {
    final result = await charactersRemoteDatasource.getCharacters(page);
    return result.toDomain();
  }
}
