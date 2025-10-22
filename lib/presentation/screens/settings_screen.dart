import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Internal dependencies
import 'package:unyo/application/cubits/settings_cubit.dart';
import 'package:unyo/application/states/settings_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<SettingsCubit>(),
        child: const _SettingsListener()
    );
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
            context
                .read<SettingsCubit>()
                .clearEffects,
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

class _SettingsViewState extends State<_SettingsView>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return const Column(
          children: [

          ],
        );
      },
    );
  }
}