import 'dart:async';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unyo/api/anilist_api_anime.dart';
import 'package:unyo/dialogs/dialogs.dart';
import 'package:unyo/models/models.dart';
import 'package:unyo/notification/notification_manager.dart';
import 'package:unyo/widgets/widgets.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:collection/collection.dart';
import 'package:unyo/sources/sources.dart';
import 'package:unyo/util/constants.dart';

class AnimeDetailsScreen extends StatefulWidget {
  const AnimeDetailsScreen(
      {super.key, required this.currentAnime, required this.tag});

  final AnimeModel currentAnime;
  final String tag;

  @override
  State<AnimeDetailsScreen> createState() => _AnimeDetailsScreenState();
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  String get _defaultAnimeSourceKey =>
      'default_anime_source_${widget.currentAnime.id}';
  UserMediaModel? userAnimeModel;
  List<String> results = [];
  int? currentResultIndex;
  int currentSource = 0;
  int latestReleasedEpisode = 0;
  late Map<int, AnimeSource> animeSources;
  late double progress;
  late double score;
  late String startDate;
  late String endDate;
  Map<String, String> query = {};
  double adjustedWidth = 0;
  double adjustedHeight = 0;
  double totalWidth = 0;
  double totalHeight = 0;
  int currentEpisodeGroup = 0;
  late MediaContentModel mediaContentModel;

  @override
  void initState() {
    super.initState();
    animeSources = globalAnimesSources;

    mediaContentModel = MediaContentModel(anilistId: widget.currentAnime.id);
    mediaContentModel.init();

    Future.delayed(Duration.zero, () async {
      if (!mounted) return;
      updateSource(getSavedSource(), context);
      setUserAnimeModel();
    });
  }

  int getSavedSource() {
    final List<String> sourcesNames =
    animeSources.values.map((a) => a.getSourceName()).toList();
    final String? savedSource = prefs.getString(_defaultAnimeSourceKey);
    if (savedSource != null && sourcesNames.contains(savedSource)) {
      logger.i("Found previously saved source: $savedSource");
      return sourcesNames.indexOf(savedSource);
    }
    return 0;
  }

  void setUserAnimeModel() async {
    UserMediaModel? newUserAnimeModel =
    await loggedUserModel.getUserAnimeInfo(widget.currentAnime.id);
    setState(() {
      userAnimeModel = newUserAnimeModel;
    });
    progress = userAnimeModel?.progress?.toDouble() ?? 0.0;
    score = userAnimeModel?.score?.toDouble() ?? 0.0;
    endDate = userAnimeModel?.endDate?.replaceAll("null", "~") ?? "~/~/~";
    startDate = userAnimeModel?.startDate?.replaceAll("null", "~") ?? "~/~/~";
    statuses.removeWhere((element) => element == userAnimeModel?.status);
    query["score"] = score.toString();
    query["progress"] = progress.toInt().toString();
    statuses = [
      userAnimeModel?.status == "" ? "NOT SET" : userAnimeModel?.status ?? "",
      ...statuses
    ];
  }

  Future<List<String>> getFirstNonEmptySearch(List<String?> titles) async {
    for (var title in titles) {
      if (title != null && title.isNotEmpty) {
        final result = await animeSources[currentSource]!.getAnimeTitles(title);
        if (result.isNotEmpty) return result;
      }
    }
    return [];
  }

  void updateResults() async {
    List<String> newResults = await getFirstNonEmptySearch([
      widget.currentAnime.userPreferedTitle,
      widget.currentAnime.englishTitle,
      widget.currentAnime.japaneseTitle,
    ]);

    int newCurrentEpisode = widget.currentAnime.status == "RELEASING"
        ? await getAnimeCurrentEpisode(widget.currentAnime.id, 0)
        : widget.currentAnime.episodes!;
    setState(() {
      latestReleasedEpisode = newCurrentEpisode;
      results = newResults;
    });
    if (!mounted) return;
    if (results.isNotEmpty) {
      NotificationManager().showSuccessNotification(
          context, "Found \"${getUtf8Text(results[0])}\"! :D",
          DesktopSnackBarPosition.bottomLeft);
    } else {
      NotificationManager().showErrorNotification(
          context, "No Title was Found!! D:",
          DesktopSnackBarPosition.bottomLeft);
    }
  }

  void updateSource(int newSource, BuildContext context) {
    if (animeSources.isEmpty && (prefs.getBool("remote_endpoint") ?? false)) {
      showNoExtensionsDialog(
        context,
      );
      Navigator.of(context).pop();
      return;
    } else if (animeSources.isEmpty &&
        !(prefs.getBool("remote_endpoint") ?? false)) {
      showErrorDialog(context,
          exception:
          "The server is down, please report at http://github.com/K3vinb5/Unyo, by opening an issue");
      Navigator.of(context).pop();
      return;
    }
    prefs.setString(
        _defaultAnimeSourceKey, animeSources[newSource]!.getSourceName());
    setState(() {
      currentSource = newSource;
      updateResults();
    });
  }

  void updateEntry(int newProgress) {
    // print("Status: ${statuses[0]}");
    if (statuses[0] != "COMPLETED") {
      query.remove("status");
      query.addAll({"status": "CURRENT"});
      widget.currentAnime.status = "CURRENT";
      statuses.swap(0, statuses.indexOf("CURRENT"));
    }
    if (statuses[0] == "CURRENT" || statuses[0] == "REPEATING") {
      progress = newProgress.toDouble();
      query.remove("progress");
      query.addAll({"progress": progress.toInt().toString()});
      loggedUserModel.setUserAnimeInfo(widget.currentAnime.id, query,
          animeModel: widget.currentAnime);
      //waits a bit because anilist database may take a but to update, for now waiting one second could be tweaked later
      Timer(
        const Duration(milliseconds: 1000),
            () {
          setUserAnimeModel();
        },
      );
    }
  }

  void openVideoQualities(String id, int animeEpisode, String animeName,
      String idMal) async {
    if (results.isEmpty) {
      showErrorDialog(context, exception: context.tr("no_title_found_dialog"));
      return;
    }
    discord.setWatchingAnimeActivity(
        widget.currentAnime, animeEpisode, mediaContentModel);
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            context.tr("select_quality"),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 44, 44, 44),
          content: VideoQualityDialog(
            adjustedWidth: adjustedWidth,
            adjustedHeight: adjustedHeight,
            updateEntry: updateEntry,
            animeEpisode: animeEpisode,
            animeModel: widget.currentAnime,
            id: id,
            idMal: idMal,
            currentAnimeSource: animeSources[currentSource]!,
          ),
        );
      },
    );
  }

  // void openAnimeInfoDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             const Text(
  //               "List Editor",
  //               style: TextStyle(color: Colors.white),
  //             ),
  //             IconButton(
  //               onPressed: () {
  //                 askForDeleteUserMedia();
  //               },
  //               icon: const Icon(Icons.delete, color: Colors.white),
  //             )
  //           ],
  //         ),
  //         backgroundColor: const Color.fromARGB(255, 44, 44, 44),
  //         content: MediaInfoDialog(
  //             id: widget.currentAnime.id,
  //             episodes: widget.currentAnime.episodes,
  //             totalWidth: totalWidth,
  //             totalHeight: totalHeight,
  //             statuses: statuses,
  //             query: query,
  //             progress: progress,
  //             currentEpisode: latestReleasedEpisode,
  //             score: score,
  //             setUserMediaModel: setUserAnimeModel,
  //             startDate: startDate,
  //             endDate: endDate,
  //             animeModel: widget.currentAnime),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: (widget.currentAnime.bannerImage != null &&
          widget.currentAnime.coverImage != null)
          ? Colors.black
          : Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          adjustedWidth =
              getAdjustedWidth(MediaQuery
                  .of(context)
                  .size
                  .width, context);
          totalWidth = MediaQuery
              .of(context)
              .size
              .width;
          adjustedHeight =
              getAdjustedHeight(MediaQuery
                  .of(context)
                  .size
                  .height, context);
          totalHeight = MediaQuery
              .of(context)
              .size
              .height;

          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      ImageGradient.linear(
                        image: Image.network(
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              // Image is fully loaded, start fading in
                              return AnimatedOpacity(
                                opacity: 1.0,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                                child: child,
                              );
                            } else {
                              // Keep the image transparent while loading
                              return AnimatedOpacity(
                                opacity: 0.0,
                                duration: const Duration(milliseconds: 0),
                                child: child,
                              );
                            }
                          },
                          widget.currentAnime.bannerImage ??
                              widget.currentAnime.coverImage!,
                          width: totalWidth,
                          height: totalHeight * 0.35,
                          fit: BoxFit.cover,
                        ),
                        colors: const [Colors.white, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      MediaDetailsCoverImageWidget(
                          coverImage: widget.currentAnime.coverImage,
                          totalHeight: totalHeight,
                          tag: widget.tag,
                          adjustedHeight: adjustedHeight,
                          adjustedWidth: adjustedWidth,
                          status: widget.currentAnime.status),
                      StyledScreenMenuWidget(
                        onBackPress: () {
                          Navigator.of(context).pop();
                        },
                        onRefreshPress: () {
                          updateSource(0, context);
                          setUserAnimeModel();

                          AnimatedSnackBar.material(
                            "Refreshing Page",
                            type: AnimatedSnackBarType.info,
                            desktopSnackBarPosition:
                            DesktopSnackBarPosition.topCenter,
                          ).show(context);
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: totalWidth,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: totalHeight * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MediaDetailsInfoWidget(
                      totalWidth: totalWidth,
                      totalHeight: totalHeight,
                      currentSource: currentSource,
                      animeSources: animeSources,
                      adjustedWidth: adjustedWidth,
                      adjustedHeight: adjustedHeight,
                      updateSource: updateSource,
                      context: context,
                      setState: setState,
                      openMediaInfoDialog: openAnimeInfoDialog,
                      currentAnime: widget.currentAnime,
                      currentEpisode: latestReleasedEpisode,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MediaResumeFromWidget(
                          totalWidth: totalWidth,
                          text:
                          "${context.tr("resume_from")} Ep.${((userAnimeModel
                              ?.progress ?? 0) + 1)}",
                          onPressed: () {
                            int episodeNum =
                            ((userAnimeModel?.progress ?? 0) + 1).toInt();
                            if ((latestReleasedEpisode + 1) <= episodeNum) {
                              return;
                            }
                            openVideoQualities(
                              manualTitleSelection
                                  ? currentSearchId!
                                  : searchesId.isNotEmpty
                                  ? searchesId[0]
                                  : "",
                              episodeNum,
                              widget.currentAnime.userPreferedTitle ?? "",
                              widget.currentAnime.idMal?.toString() ?? "-1",
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MediaDetailsListNavigationWidget(
                          totalWidth: totalWidth,
                          currentEpisodeGroup: currentEpisodeGroup,
                          currentEpisode: latestReleasedEpisode,
                          totalEpisodes: widget.currentAnime.episodes,
                          episodeGroupBack: () {
                            setState(() {
                              currentEpisodeGroup--;
                            });
                          },
                          episodeGroupForward: () {
                            setState(() {
                              currentEpisodeGroup++;
                            });
                          },
                        ),
                        MediaDetailsListViewWidget(
                          totalWidth: totalWidth,
                          totalHeight: totalHeight,
                          currentEpisodeGroup: currentEpisodeGroup,
                          currentEpisode: latestReleasedEpisode,
                          totalEpisodes: widget.currentAnime.episodes,
                          itemBuilder: (context, index) {
                            return EpisodeButton(
                              index: index,
                              currentEpisodeGroup: currentEpisodeGroup,
                              currentAnime: widget.currentAnime,
                              userAnimeModel: userAnimeModel,
                              mediaContentModel: mediaContentModel,
                              latestEpisode: latestReleasedEpisode,
                              latestEpisodeWatched:
                              userAnimeModel?.progress ?? 0,
                              videoQualities: openVideoQualities,
                              currentSearchId: manualTitleSelection
                                  ? currentSearchId
                                  : (currentSearchIndex ?? 0) <
                                          searchesId.length
                                      ? searchesId[currentSearchIndex ?? 0]
                                      : "",
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const WindowBarButtons(startIgnoreWidth: 70)
            ],
          );
        },
      ),
    );
  }
}
