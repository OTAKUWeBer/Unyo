import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/application/cubits/login_cubit.dart';
import 'package:unyo/presentation/widgets/text/text_body_medium.dart';

import '../../application/states/login_state.dart';

class AccountCreationDialog extends StatelessWidget {
  const AccountCreationDialog({super.key, required this.screenContext});

  final BuildContext screenContext;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<LoginCubit>(screenContext),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Dialog(
            child: Column(
              children: [
                TextBodyMedium(text: state.availableUsers.length.toString())
              ],
            ),
          );
        },
      ),
    );
  }
}
