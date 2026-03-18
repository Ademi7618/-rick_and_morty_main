import 'package:rick_and_morty/features/character/domain/entities/character.dart';

class Page {
  final List<Character> characters;
  final int? next;
  final int? prev;
  const Page({
    required this.characters,
    required this.next,
    required this.prev,
  });
}
