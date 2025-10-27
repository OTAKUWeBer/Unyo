import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/application/cubits/anime_advanced_search_cubit.dart';
import 'package:unyo/application/states/anime_advanced_search_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';

@RoutePage()
class AnimeAdvancedSearchScreen extends StatelessWidget {
  const AnimeAdvancedSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AnimeAdvancedSearchCubit>(),
      child: const _AnimeAdvancedSearchListener(),
    );
  }
}

class _AnimeAdvancedSearchListener extends StatelessWidget {
  const _AnimeAdvancedSearchListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnimeAdvancedSearchCubit, AnimeAdvancedSearchState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<AnimeAdvancedSearchCubit>().clearEffects,
          );
        }
      },
      child: const _AnimeAdvancedSearchView(),
    );
  }
}

class _AnimeAdvancedSearchView extends StatefulWidget {
  const _AnimeAdvancedSearchView();

  @override
  State<_AnimeAdvancedSearchView> createState() => _AnimeAdvancedSearchViewState();
}

class _AnimeAdvancedSearchViewState extends State<_AnimeAdvancedSearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeAdvancedSearchCubit, AnimeAdvancedSearchState>(
      builder: (context, state) {
        return const Column(children: []);
      },
    );
  }
}
