import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/application/cubits/media_list_cubit.dart';
import 'package:unyo/application/states/media_list_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/media_type.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/presentation/widgets/styled/dark_unyo_button.dart';

@RoutePage()
class MediaListScreen extends StatelessWidget {
  final String? type;

  const MediaListScreen(@QueryParam('type') this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MediaListCubit>(),
      child: _MediaListListener(type: MediaTypeFactory.fromString(type!)),
    );
  }
}

class _MediaListListener extends StatelessWidget {
  final MediaType type;

  const _MediaListListener({super.key, required this.type});

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
      child: _MediaListView(type: type),
    );
  }
}

class _MediaListView extends StatefulWidget {
  final MediaType type;

  const _MediaListView({super.key, required this.type});

  @override
  State<_MediaListView> createState() => _MediaListViewState();
}

class _MediaListViewState extends State<_MediaListView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaListCubit, MediaListState>(
      builder: (context, state) {
        final TabController tabController = TabController(
          length:
              widget.type == MediaType.anime
                  ? state.userAnimeLists.length
                  : state.userMangaLists.length,
          vsync: this,
        );
        return Column(
          children: [
            DarkUnyoButton(onPressed: AutoRouter.of(context).pop, text: "Back"),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                children: [
                  Text(
                    "Hi! ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    state.loggedUser.name,
                    style: TextStyle(
                      color: ColorScheme.of(context).tertiary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    ", welcome to your ${widget.type == MediaType.anime ? "Anime" : "Manga"} Lists!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TabBar(
                labelColor: Colors.white,
                dividerColor: ColorScheme.of(
                  context,
                ).secondary.withOpacity(0.5),
                indicatorColor: ColorScheme.of(context).primary,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                controller: tabController,
                tabs: [
                  ...(widget.type == MediaType.anime
                          ? state.userAnimeLists
                          : state.userMangaLists)
                      .entries
                      .map((entry) {
                        String title = entry.key;
                        return SizedBox(width: 150, child: Tab(text: title));
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 1.sh - 100,
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Text("a");
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
