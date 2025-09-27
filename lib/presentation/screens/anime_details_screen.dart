import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/application/cubits/anime_details_cubit.dart';
import 'package:unyo/application/states/anime_details_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/presentation/views/loading_view.dart';

@RoutePage()
class AnimeDetailsScreen extends StatelessWidget {
  const AnimeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AnimeDetailsCubit>(),
      child: _AnimeDetailsListener(),
    );
  }
}

class _AnimeDetailsListener extends StatelessWidget {
  const _AnimeDetailsListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnimeDetailsCubit, AnimeDetailsState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<AnimeDetailsCubit>().clearEffects,
          );
        }
      },
      child: BlocBuilder<AnimeDetailsCubit, AnimeDetailsState>(
        builder: (context, state) => _AnimeDetailsView(),
      ),
    );
  }
}

class _AnimeDetailsView extends StatefulWidget {
  const _AnimeDetailsView({super.key});

  @override
  State<_AnimeDetailsView> createState() => _AnimeDetailsViewState();
}

class _AnimeDetailsViewState extends State<_AnimeDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeDetailsCubit, AnimeDetailsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed:
                        () =>
                            context
                                .read<AnimeDetailsCubit>()
                                .navigateBackToAnimePage(),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ],
              ),
              Container(),
              Container(),
            ],
          ),
        );
      },
    );
  }
}
