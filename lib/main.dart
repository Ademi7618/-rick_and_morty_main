import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/di/service_locator.dart';
import 'package:rick_and_morty/features/character/presentation/screens/characters_screen.dart';

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CharactersScreen(),
    );
  }
}
