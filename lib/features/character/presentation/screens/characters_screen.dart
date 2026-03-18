import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/service_locator.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/features/character/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty/features/character/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    sl<CharactersBloc>().add(LoadCharactersEvent(0));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      sl<CharactersBloc>().add(LoadNextPageEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CharactersBloc, CharactersState>(
          bloc: sl<CharactersBloc>(),
          builder: (context, state) {
            if (state is CharactersLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CharactersLoadedSuccess) {
              return ListView.builder(
                controller: _scrollController,
                itemCount:
                    state.characters.length + (state.isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < state.characters.length) {
                    return CharacterItem(character: state.characters[index]);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else if (state is CharactersError) {
              return Text(
                state.message,
                style: TextStyle(color: AppColors.error),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
