// Flutter dependencies
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Internal dependencies
import 'package:unyo/application/cubits/home_cubit.dart';
import 'package:unyo/application/states/home_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/presentation/views/loading_view.dart';
import 'package:unyo/presentation/widgets/styled/styled.dart';
import 'package:unyo/presentation/widgets/text/texts.dart';

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
      child: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => state.isLoading ? LoadingView() : _HomeView(),
      )
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView({super.key});

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  final ScrollController continueWatchingController = ScrollController();
  final ScrollController continueReadingController = ScrollController();

  @override
  void dispose() {
    continueWatchingController.dispose();
    continueReadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 15.0.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 25.0.h,),
                SizedBox(
                  width: 1.sw - 140,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextDisplaySmall(text: "Welcome back "),
                          TextDisplaySmall(
                            text: state.loggedUser.name,
                            style: TextStyle(
                              color: ColorScheme.of(context).tertiary,
                            ),
                          ),
                          TextDisplaySmall(text: " , enjoy your journey!"),
                          Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          TextBodyLarge(
                            text: "Find your next favorite anime or manga!",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediaButton(
                        onPressed: () {},
                        image:
                            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/170942-v2GO5YNO0Q5I.jpg",
                        text: "Anime List",
                      ),
                      SizedBox(width: 50.w),
                      MediaButton(
                        onPressed: () {},
                        image:
                            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/170942-v2GO5YNO0Q5I.jpg",
                        text: "Manga List",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                AnimeCardList(
                  listTitle: "Continue Watching",
                  animeList: state.continueWatching,
                  controller: continueWatchingController,
                  loadMore: false,
                ),
                const SizedBox(height: 20),
                MangaCardList(
                  listTitle: "Continue Reading",
                  mangaList: state.continueReading,
                  controller: continueReadingController,
                  loadMore: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}