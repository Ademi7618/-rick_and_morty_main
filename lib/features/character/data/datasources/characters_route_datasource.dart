import 'package:dio/dio.dart';
import 'package:rick_and_morty/features/character/data/datasources/i_characters_remote_datasource.dart';
import 'package:rick_and_morty/features/character/data/models/characters_response_model.dart';
import 'package:rick_and_morty/features/character/data/models/page_model.dart';

class CharactersRemoteDatasource implements ICharactersRemoteDatasource {
  final Dio dio;

  CharactersRemoteDatasource(this.dio);

  @override
  Future<CharactersResponseModel> getCharacters(int page) async {
  
    final result = await dio.get(
      'https://rickandmortyapi.com/api/character/?page=$page',
    );
    
    final charactersResponseJson = result.data;
    if (charactersResponseJson == null) {
      return const CharactersResponseModel(PageModel(null, null), []);
    }

    return CharactersResponseModel.fromJson(charactersResponseJson);
  }
}