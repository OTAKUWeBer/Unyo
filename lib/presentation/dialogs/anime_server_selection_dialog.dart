import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/application/cubits/anime_cubit.dart';
import 'package:unyo/application/states/anime_state.dart';

class AnimeServerSelectionDialog extends StatelessWidget {
  const AnimeServerSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeState>(
      builder: (context, state) => Dialog(
          child: SizedBox(
              width: 906.w,
              height: 540.h,
              child: const Column(
              children: [

            ],
          ),
          )
      ),
    );
  }
}
