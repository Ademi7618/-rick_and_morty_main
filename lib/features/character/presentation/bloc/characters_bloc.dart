import 'package:bloc/bloc.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';
import 'package:rick_and_morty/features/character/domain/usecases/get_characters_usecase.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharactersUsecase getCharactersUsecase;
  int? nextPage = 0;
  List<Character> characters = [];
  CharactersBloc(this.getCharactersUsecase) : super(CharactersInitial()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
    on<LoadNextPageEvent>(_onLoadNextPage);
  }

  Future<void> _onLoadCharacters(
    LoadCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    if (characters.isEmpty) {
      emit(CharactersLoading());
    }

    if (state is CharactersLoadedSuccess) {
      emit(
        CharactersLoadedSuccess(characters: characters, isLoadingMore: true),
      );
    }

    final result = await getCharactersUsecase(event.page);
    nextPage = result.next;
    characters.addAll(result.characters);
    emit(CharactersLoadedSuccess(characters: characters));
  }

  Future<void> _onLoadNextPage(
    LoadNextPageEvent event,
    Emitter<CharactersState> emit,
  ) async {
    if (nextPage != null) {
      add(LoadCharactersEvent(nextPage!));
    }
  }
}
