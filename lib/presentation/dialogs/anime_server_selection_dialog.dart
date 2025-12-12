import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/application/cubits/anime_details_cubit.dart';
import 'package:unyo/application/states/anime_details_state.dart';
import 'package:unyo/core/di/locator.dart';

class AnimeServerSelectionDialog extends StatelessWidget {
  const AnimeServerSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AnimeDetailsCubit>(),
      child: BlocBuilder<AnimeDetailsCubit, AnimeDetailsState>(
        builder: (context, state) =>
            Dialog(
                child: SizedBox(
                  width: 906.w,
                  height: 540.h,
                  child: Column(
                    children: [
                      Text("Status: ${state.mediaListEntry.status}"),
                      Text("Progress: ${state.mediaListEntry.progress}"),
                      Text("Started At: ${state.mediaListEntry.startedAt[0]}/${state.mediaListEntry
                          .startedAt[1]}/${state.mediaListEntry.startedAt[2]}"),
                      Text("Completed At: ${state.mediaListEntry.completedAt[0]}/${state.mediaListEntry
                          .completedAt[1]}/${state.mediaListEntry.completedAt[2]}"),
                    ],
                  ),
                )
            ),
      ),
    );
  }
}
