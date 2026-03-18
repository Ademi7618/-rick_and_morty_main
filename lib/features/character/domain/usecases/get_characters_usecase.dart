import 'package:rick_and_morty/features/character/domain/entities/page.dart';
import 'package:rick_and_morty/features/character/domain/repositories/i_characters_repository.dart';

class GetCharactersUsecase {
  final ICharactersRepository repository;
  const GetCharactersUsecase(this.repository);
  Future<Page> call(int page) => repository.getCharacters(page);
}
