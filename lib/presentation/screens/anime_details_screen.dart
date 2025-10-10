// External package dependencies
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Internal package dependencies
import 'package:unyo/application/cubits/anime_details_cubit.dart';
import 'package:unyo/application/states/anime_details_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/presentation/widgets/styled/styled.dart';
import 'package:unyo/presentation/widgets/styled/unyo_banner.dart';
import 'package:unyo/presentation/widgets/text/text_utils.dart';

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
        return Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        onPressed:
                            () =>
                                context
                                    .read<AnimeDetailsCubit>()
                                    .navigateBackToAnimePage(),
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 75,
                    child: SizedBox(
                      height: 1.sh - 60,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    UnyoBanner(
                                      imageUrl: state.selectedAnime.bannerImage,
                                      duration: "${state.selectedAnime.duration}min",
                                      year: TextUtils.extractYearFromStartDate(state.selectedAnime.startDate, state.loggedUser),
                                      score: state.selectedAnime.averageScore.toString(),
                                      description: state.selectedAnime.description,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 60.w, top: 140.h),
                                      child: ImageCard(
                                        coverImage:
                                            state.selectedAnime.coverImage,
                                        title: state.selectedAnime.title.userPreferred,
                                        status: state.selectedAnime.status,
                                        tag: "${state.selectedMediaList.name}-${state.selectedAnime.id}",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 35,
                    child: Container(
                      height: 1.sh - 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 35),
                          Expanded(
                            child: ListView(
                              children: [
                                UnyoEpisodeButton(
                                  episodeName: "Episode 1 Name",
                                  episodeImageUrl:
                                      "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114124-44utnIatIX16.jpg",
                                  episodeNumber: 1,
                                  progress: 1,
                                  released: 1,
                                  showDivider: false,
                                ),
                                UnyoEpisodeButton(
                                  episodeName: "Episode 2 Name",
                                  episodeImageUrl:
                                      "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114124-44utnIatIX16.jpg",
                                  episodeNumber: 2,
                                  progress: 1,
                                  released: 2,
                                  showDivider: true,
                                ),
                                UnyoEpisodeButton(
                                  episodeName: "Episode 2 Name",
                                  episodeImageUrl:
                                      "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114124-44utnIatIX16.jpg",
                                  episodeNumber: 2,
                                  progress: 1,
                                  released: 2,
                                  showDivider: true,
                                ),
                                UnyoEpisodeButton(
                                  episodeName: "Episode 2 Name",
                                  episodeImageUrl:
                                      "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114124-44utnIatIX16.jpg",
                                  episodeNumber: 2,
                                  progress: 1,
                                  released: 2,
                                  showDivider: true,
                                ),
                                UnyoEpisodeButton(
                                  episodeName: "Episode 2 Name",
                                  episodeImageUrl:
                                      "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114124-44utnIatIX16.jpg",
                                  episodeNumber: 2,
                                  progress: 1,
                                  released: 2,
                                  showDivider: true,
                                ),
                                UnyoEpisodeButton(
                                  episodeName: "Episode 2 Name",
                                  episodeImageUrl:
                                      "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114124-44utnIatIX16.jpg",
                                  episodeNumber: 2,
                                  progress: 1,
                                  released: 2,
                                  showDivider: true,
                                ),
                                UnyoEpisodeButton(
                                  episodeName: "Episode 2 Name",
                                  episodeImageUrl:
                                      "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114124-44utnIatIX16.jpg",
                                  episodeNumber: 2,
                                  progress: 1,
                                  released: 2,
                                  showDivider: true,
                                ),
                                UnyoEpisodeButton(
                                  episodeName: "Episode 2 Name",
                                  episodeImageUrl:
                                      "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114124-44utnIatIX16.jpg",
                                  episodeNumber: 2,
                                  progress: 1,
                                  released: 2,
                                  showDivider: true,
                                ),
                                UnyoEpisodeButton(
                                  episodeName: "Episode 2 Name",
                                  episodeImageUrl:
                                      "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114124-44utnIatIX16.jpg",
                                  episodeNumber: 2,
                                  progress: 1,
                                  released: 2,
                                  showDivider: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
