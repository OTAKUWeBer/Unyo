import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/application/cubits/anime_cubit.dart';
import 'package:unyo/application/states/anime_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/presentation/widgets/styled/media_button.dart';
import 'package:unyo/presentation/widgets/styled/unyo_banner_carousel.dart';

@RoutePage()
class AnimeScreen extends StatelessWidget {
  const AnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AnimeCubit>(),
      child: _AnimeListener(),
    );
  }
}

class _AnimeListener extends StatelessWidget {
  const _AnimeListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnimeCubit, AnimeState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<AnimeCubit>().clearEffects,
          );
        }
      },
      child: _AnimeView(),
    );
  }
}

class _AnimeView extends StatefulWidget {
  const _AnimeView({super.key});

  @override
  State<_AnimeView> createState() => _AnimeViewState();
}

class _AnimeViewState extends State<_AnimeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 20.0.h),
              UnyoBannerCarousel(
                animeList: state.recentlyReleased.$2
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MediaButton(
                    onPressed: () {},
                    image:
                        "https://s4.anilist.co/file/anilistcdn/media/anime/banner/97938-cT6wkSRifTEC.jpg",
                    text: "Calendar",
                  ),
                  const SizedBox(width: 30,),
                  MediaButton(
                    onPressed: () {},
                    image:
                        "https://s4.anilist.co/file/anilistcdn/media/anime/banner/1735.jpg",
                    text: "Advanced Search",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
