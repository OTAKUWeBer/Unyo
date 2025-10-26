import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Internal dependencies
import 'package:unyo/application/cubits/settings_cubit.dart';
import 'package:unyo/application/states/settings_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/presentation/widgets/styled/unyo_settings_category.dart';
import 'package:unyo/presentation/widgets/styled/unyo_settings_selection_dialog.dart';
import 'package:unyo/presentation/widgets/text/text_body_large.dart';
import 'package:unyo/presentation/widgets/text/text_headline_medium.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => sl<SettingsCubit>(), child: const _SettingsListener());
  }
}

class _SettingsListener extends StatelessWidget {
  const _SettingsListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<SettingsCubit>().clearEffects,
          );
        }
      },
      child: const _SettingsView(),
    );
  }
}

class _SettingsView extends StatefulWidget {
  const _SettingsView();

  @override
  State<_SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<_SettingsView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                children: [
                  SizedBox(width: 40.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const TextHeadlineMedium(
                            text: "Manage your ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextHeadlineMedium(
                            text: "Settings!",
                            style: TextStyle(
                              color: ColorScheme.of(context).tertiary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextBodyLarge(
                            text: "You can find and change your settings here",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.0.h),
                child: ListView(
                  children: [
                    UnyoSettingsCategory(
                      title: "Accounts",
                      description: "Manage your connected accounts",
                      icon: Icons.person_outline_rounded,
                      alignment: "top",
                      childAlignment: "center",
                      settingsOptions: [
                        UnyoSettingsCategory(
                          title: "Anilist",
                          description: "Manage your Anilist connected accounts",
                          icon: Icons.format_list_bulleted_rounded,
                          alignment: "",
                          childAlignment: "",
                          isChild: true,
                          settingsOptions: [
                            // TODO - Anilist account settings go here
                          ],
                        ),
                        UnyoSettingsCategory(
                          title: "MyAnimeList",
                          description: "Manage your MyAnimeList connected accounts",
                          icon: Icons.format_list_bulleted_rounded,
                          alignment: "",
                          childAlignment: "",
                          isChild: true,
                          settingsOptions: [
                            // TODO - MyAnimeList account settings go here
                          ],
                        ),
                        UnyoSettingsCategory(
                          title: "Shikimori",
                          description: "Manage your Shikimori connected accounts",
                          icon: Icons.format_list_bulleted_rounded,
                          alignment: "",
                          childAlignment: "",
                          isChild: true,
                          settingsOptions: [
                            // TODO - Shikimori account settings go here
                          ],
                        ),
                      ],
                    ),
                    UnyoSettingsCategory(
                      title: "Common",
                      description: "General application settings",
                      icon: Icons.lightbulb_rounded,
                      alignment: "",
                      childAlignment: "",
                      settingsOptions: [
                        UnyoSettingsSelectionDialog(
                            title: "Media Metadata Service",
                            description: "Select the Media Metadata service to use",
                            icon: Icons.image_search_rounded,
                            openDialog: (){}
                        ),
                        UnyoSettingsSelectionDialog(
                            title: "Episode Metadata Service",
                            description: "Select the Episode Metadata service to use",
                            icon: Icons.movie_filter_rounded,
                            openDialog: (){}
                        ),
                      ],
                    ),
                    UnyoSettingsCategory(
                      title: "Theme",
                      description: "Appearance settings",
                      icon: Icons.edit_rounded,
                      alignment: "",
                      childAlignment: "",
                      settingsOptions: [],
                    ),
                    UnyoSettingsCategory(
                      title: "Player",
                      description: "Video player settings",
                      icon: Icons.play_arrow_rounded,
                      alignment: "",
                      childAlignment: "",
                      settingsOptions: [],
                    ),
                    UnyoSettingsCategory(
                      title: "Reader",
                      description: "Manga reader settings",
                      icon: Icons.my_library_books_rounded,
                      alignment: "",
                      childAlignment: "",
                      settingsOptions: [],
                    ),
                    UnyoSettingsCategory(
                      title: "Extensions",
                      description: "Extensions management settings",
                      icon: Icons.extension_rounded,
                      alignment: "",
                      childAlignment: "",
                      settingsOptions: [
                        UnyoSettingsSelectionDialog(
                            title: "Aniyomi Extensions Repository",
                            description: "Change the Aniyomi extensions repository URL",
                            icon: Icons.link_rounded,
                            openDialog: (){}
                        ),
                        UnyoSettingsSelectionDialog(
                            title: "Tachiyomi Extensions Repository",
                            description: "Change the Tachiyomi extensions repository URL",
                            icon: Icons.link_rounded,
                            openDialog: (){}
                        )
                      ],
                    ),
                    UnyoSettingsCategory(
                      title: "About",
                      description: "About the app",
                      icon: Icons.info_rounded,
                      alignment: "bottom",
                      childAlignment: "bottom",
                      settingsOptions: [],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
