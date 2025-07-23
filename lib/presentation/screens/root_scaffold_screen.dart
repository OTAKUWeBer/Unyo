// External dependencies
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/application/cubits/root_scaffold_cubit.dart';
import 'package:unyo/application/states/root_scaffold_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/selected_menu_option.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/presentation/widgets/styled/unyo_menu_bar.dart';
import 'package:unyo/presentation/widgets/styled/unyo_menu_icon.dart';

@RoutePage()
class RootScaffoldScreen extends StatelessWidget {
  const RootScaffoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RootScaffoldCubit>(),
      child: const _RootScaffoldListener(),
    );
  }
}

class _RootScaffoldListener extends StatelessWidget {
  const _RootScaffoldListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RootScaffoldCubit, RootScaffoldState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<RootScaffoldCubit>().clearEffects,
          );
        }
      },
      child: _RootScaffoldView(),
    );
  }
}

class _RootScaffoldView extends StatelessWidget {
  const _RootScaffoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootScaffoldCubit, RootScaffoldState>(
      builder: (context, state) {
        return Scaffold(
          // Back
          body: Stack(
            children: [
              // Gradient base
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.transparent,
                      ColorScheme
                          .of(context)
                          .primary
                          .withValues(alpha: 140),
                    ],
                  ),
                ),
              ),
              // Glow overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topLeft,
                      radius: 0.7,
                      colors: [
                        ColorScheme
                            .of(context)
                            .primary
                            .withValues(alpha: 140),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Optional blur for softness
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 70.0, sigmaY: 70.0),
                  child: Container(color: Colors.transparent),
                ),
              ),
              Row(
                mainAxisAlignment:
                state.showMenuBar
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state.showMenuBar
                      ? UnyoMenuBar(
                    avatarImage: state.loggedUser.avatarImage,
                    icons: [
                      UnyoMenuIcon(
                        isSelected:
                        state.selectedMenuOption ==
                            SelectedMenuOption.home,
                        onPressed:
                            () =>
                            context
                                .read<RootScaffoldCubit>()
                                .selectMenuOption(SelectedMenuOption.home),
                        unselectedIcon: Icons.home_outlined,
                        selectedIcon: Icons.home,
                      ),
                      UnyoMenuIcon(
                        isSelected:
                        state.selectedMenuOption ==
                            SelectedMenuOption.anime,
                        onPressed:
                            () =>
                            context
                                .read<RootScaffoldCubit>()
                                .selectMenuOption(SelectedMenuOption.anime),
                        unselectedIcon: Icons.movie_outlined,
                        selectedIcon: Icons.movie,
                      ),
                      UnyoMenuIcon(
                        isSelected:
                        state.selectedMenuOption ==
                            SelectedMenuOption.manga,
                        onPressed:
                            () =>
                            context
                                .read<RootScaffoldCubit>()
                                .selectMenuOption(SelectedMenuOption.manga),
                        unselectedIcon: Icons.menu_book_outlined,
                        selectedIcon: Icons.menu_book,
                      ),
                      UnyoMenuIcon(
                        isSelected:
                        state.selectedMenuOption ==
                            SelectedMenuOption.library,
                        onPressed:
                            () =>
                            context
                                .read<RootScaffoldCubit>()
                                .selectMenuOption(
                              SelectedMenuOption.library,
                            ),
                        unselectedIcon: Icons.local_library_outlined,
                        selectedIcon: Icons.local_library,
                      ),
                      UnyoMenuIcon(
                        isSelected:
                        state.selectedMenuOption ==
                            SelectedMenuOption.extensions,
                        onPressed:
                            () =>
                            context
                                .read<RootScaffoldCubit>()
                                .selectMenuOption(
                              SelectedMenuOption.extensions,
                            ),
                        unselectedIcon: Icons.extension_outlined,
                        selectedIcon: Icons.extension,
                      ),
                    ],
                  )
                      : const SizedBox.shrink(),
                  Expanded(child: AutoRouter()),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
