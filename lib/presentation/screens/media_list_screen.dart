import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/application/cubits/media_list_cubit.dart';
import 'package:unyo/application/states/media_list_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';

@RoutePage()
class MediaListScreen extends StatelessWidget {
  const MediaListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MediaListCubit>(),
      child: _MediaListListener(),
    );
  }
}

class _MediaListListener extends StatelessWidget {
  const _MediaListListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MediaListCubit, MediaListState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<MediaListCubit>().clearEffects,
          );
        }
      },
      child: _MediaListView(),
    );
  }
}

class _MediaListView extends StatefulWidget {
  const _MediaListView({super.key});

  @override
  State<_MediaListView> createState() => _MediaListViewState();
}

class _MediaListViewState extends State<_MediaListView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
