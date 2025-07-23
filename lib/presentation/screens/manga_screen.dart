import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/application/cubits/manga_cubit.dart';
import 'package:unyo/application/states/manga_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';

@RoutePage()
class MangaScreen extends StatelessWidget {
  const MangaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MangaCubit>(),
      child: _MangaListener(),
    );
  }
}

class _MangaListener extends StatelessWidget {
  const _MangaListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MangaCubit, MangaState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<MangaCubit>().clearEffects,
          );
        }
      },
      child: _MangaView(),
    );
  }
}

class _MangaView extends StatefulWidget {
  const _MangaView({super.key});

  @override
  State<_MangaView> createState() => _MangaViewState();
}

class _MangaViewState extends State<_MangaView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
