part of 'characters_bloc.dart';

sealed class CharactersEvent {}

class LoadCharactersEvent extends CharactersEvent {
  final int page;
  LoadCharactersEvent(this.page);
}

class LoadNextPageEvent extends CharactersEvent {}

class LoadPrevPageEvent extends CharactersEvent {}
