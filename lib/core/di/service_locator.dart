import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/features/character/data/datasources/characters_route_datasource.dart';
import 'package:rick_and_morty/features/character/data/datasources/i_characters_remote_datasource.dart';
import 'package:rick_and_morty/features/character/data/repositories/characters_repository.dart';
import 'package:rick_and_morty/features/character/domain/repositories/i_characters_repository.dart';
import 'package:rick_and_morty/features/character/domain/usecases/get_characters_usecase.dart';
import 'package:rick_and_morty/features/character/presentation/bloc/characters_bloc.dart';

final sl = GetIt.instance;

void serviceLocator() {
  sl
    ..registerLazySingleton(
      () => Dio(),
    )
    ..registerLazySingleton<ICharactersRemoteDatasource>(
      () => CharactersRemoteDatasource(sl()),
    )
    ..registerLazySingleton<ICharactersRepository>(
      () => CharactersRepository(sl()),
    )
    ..registerLazySingleton(() => GetCharactersUsecase(sl()))
    ..registerLazySingleton(() => CharactersBloc(sl()));
}
