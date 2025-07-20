// Flutter dependencies
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Internal dependencies
import 'package:unyo/application/cubits/home_cubit.dart';
import 'package:unyo/application/states/home_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/selected_menu_option.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/presentation/widgets/styled/styled.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: _HomeListener(),
    );
  }
}

class _HomeListener extends StatelessWidget {
  const _HomeListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<HomeCubit>().clearEffects,
          );
        }
      },
      child: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UnyoMenuBar(
                avatarImage: state.loggedUser.avatarImage,
                icons: [
                  UnyoMenuIcon(
                      isSelected: state.selectedMenuOption == SelectedMenuOption.home,
                      onPressed:() => context.read<HomeCubit>().selectMenuOption(SelectedMenuOption.home),
                      unselectedIcon: Icons.home_outlined,
                      selectedIcon: Icons.home
                  ),
                  UnyoMenuIcon(
                      isSelected: state.selectedMenuOption == SelectedMenuOption.anime,
                      onPressed:() => context.read<HomeCubit>().selectMenuOption(SelectedMenuOption.anime),
                      unselectedIcon: Icons.movie_outlined,
                      selectedIcon: Icons.movie
                  ),
                  UnyoMenuIcon(
                      isSelected: state.selectedMenuOption == SelectedMenuOption.manga,
                      onPressed:() => context.read<HomeCubit>().selectMenuOption(SelectedMenuOption.manga),
                      unselectedIcon: Icons.menu_book_outlined,
                      selectedIcon: Icons.menu_book
                  ),
                  UnyoMenuIcon(
                      isSelected: state.selectedMenuOption == SelectedMenuOption.library,
                      onPressed:() => context.read<HomeCubit>().selectMenuOption(SelectedMenuOption.library),
                      unselectedIcon: Icons.local_library_outlined,
                      selectedIcon: Icons.local_library
                  ),
                  UnyoMenuIcon(
                      isSelected: state.selectedMenuOption == SelectedMenuOption.extensions,
                      onPressed:() => context.read<HomeCubit>().selectMenuOption(SelectedMenuOption.extensions),
                      unselectedIcon: Icons.extension_outlined,
                      selectedIcon: Icons.extension
                  ),
                ],
              )
          // TextLabelMedium(text: state.loggedUser.toString())
            ]
        );
      },
    );
  }
}
