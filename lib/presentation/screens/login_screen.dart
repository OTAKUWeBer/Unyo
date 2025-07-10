// Flutter dependencies
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

//External dependencies
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Internal dependencies
import 'package:unyo/application/cubits/login_cubit.dart';
import 'package:unyo/application/states/login_state.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/presentation/widgets/styled/styled.dart';
import 'package:unyo/presentation/widgets/text/texts.dart';
import 'package:unyo/core/di/locator.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: _LoginListener(),
    );
  }
}

class _LoginListener extends StatelessWidget {
  const _LoginListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<LoginCubit>().clearEffects,
          );
        }
      },
      child: _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView({super.key});

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  late final TextEditingController loginTextFieldController;

  @override
  void initState() {
    super.initState();
    loginTextFieldController = TextEditingController();
    context.read<LoginCubit>().fetchAllUsers();
  }

  @override
  void dispose() {
    super.dispose();
    loginTextFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextDisplayLarge(text: context.tr("select_user")),
            SizedBox(height: 0.07.sh),
            SizedBox(
              height: 0.35.sh,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...state.availableUsers.map(
                      (user) => UserAvatar(user: user, onPressed: (){}),
                    ),
                    AddUserAvatar(onPressed: () {}),
                    // Display existing users
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
