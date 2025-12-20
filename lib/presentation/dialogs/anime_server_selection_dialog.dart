import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k3vinb5_aniyomi_bridge/jmodels/jvideo.dart';
import 'package:unyo/application/cubits/anime_details_cubit.dart';
import 'package:unyo/application/states/anime_details_state.dart';
import 'package:unyo/presentation/views/loading_view.dart';
import 'package:unyo/presentation/widgets/styled/unyo_server_button.dart';

class AnimeServerSelectionDialog extends StatelessWidget {
  final AnimeDetailsCubit cubit;

  const AnimeServerSelectionDialog({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<AnimeDetailsCubit, AnimeDetailsState>(
        builder:
            (context, state) => Dialog(
              backgroundColor: const Color.fromARGB(255, 30, 30, 30),
              child: state.animeServerDialogReady ? SizedBox(
                width: 600.w,
                height: 540.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 36.0.h),
                  child: Column(
                    children: [
                      const Text(
                        "Select Server",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      ...state.extensionVideoResults.map(
                        (JVideo video) => Column(
                          children: [SizedBox(height: 25.0.h), UnyoServerButton(videoServer: video)],
                        ),
                      ),
                    ],
                  ),
                ),
              ) : const LoadingView(),
            ),
      ),
    );
  }
}
