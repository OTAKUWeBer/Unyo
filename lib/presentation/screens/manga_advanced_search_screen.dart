import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/application/cubits/manga_advanced_search_cubit.dart';
import 'package:unyo/application/states/manga_advanced_search_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';

@RoutePage()
class MangaAdvancedSearchScreen extends StatelessWidget {
  const MangaAdvancedSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MangaAdvancedSearchCubit>(),
      child: const _MangaAdvancedSearchListener(),
    );
  }
}

class _MangaAdvancedSearchListener extends StatelessWidget {
  const _MangaAdvancedSearchListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MangaAdvancedSearchCubit, MangaAdvancedSearchState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<MangaAdvancedSearchCubit>().clearEffects,
          );
        }
      },
      child: const _MangaAdvancedSearchView(),
    );
  }
}

class _MangaAdvancedSearchView extends StatefulWidget {
  const _MangaAdvancedSearchView();

  @override
  State<_MangaAdvancedSearchView> createState() => _MangaAdvancedSearchViewState();
}

class _MangaAdvancedSearchViewState extends State<_MangaAdvancedSearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaAdvancedSearchCubit, MangaAdvancedSearchState>(
      builder: (context, state) {
        return const Column(children: []);
      },
    );
  }
}
