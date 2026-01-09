// External dependencies
import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Internal dependencies
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/application/cubits/video_cubit.dart';
import 'package:unyo/application/states/video_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/video/video_service.dart';
import 'package:unyo/presentation/views/loading_view.dart';
import 'package:unyo/presentation/widgets/styled/unyo_video_texture.dart';

@RoutePage()
class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => sl<VideoCubit>(), child: const _VideoListener());
  }
}

class _VideoListener extends StatelessWidget {
  const _VideoListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<VideoCubit, VideoState>(
      listener: (context, state) {
        if (state.effects.isNotEmpty) {
          sl<AppEffectHandler>().handleEffects(
            context,
            state.effects,
            context.read<VideoCubit>().clearEffects,
          );
        }
      },
      child: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) => state.isLoading ? const _VideoLoadingView() : const _VideoView(),
      ),
    );
  }
}

class _VideoLoadingView extends StatelessWidget {
  const _VideoLoadingView();

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.black,
      child: LoadingView(description: "The video is loading"),
    );
  }
}

class _VideoView extends StatefulWidget {
  const _VideoView();

  @override
  State<_VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<_VideoView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _refreshTimer;
  late VideoService _videoService;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400), // Adjust the duration as needed
    );
    _videoService = context.read<VideoCubit>().videoService;
    _refreshTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (mounted && _videoService.isPlaying) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _refreshTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        return Material(
          color: Colors.black,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Video
              UnyoVideoTexture(videoService: _videoService),
              // Header
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => context.read<VideoCubit>().navigateBackToAnimeDetailsPage(context),
                          icon: Icon(Icons.arrow_back_ios_new_rounded, color: ColorScheme.of(context).tertiary),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "${state.selectedAnime.title.userPreferred}  -  Episode ${state.videoInfo.playlistIndex + 1}",
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Video Controls Overlay
              const Align(
                alignment: Alignment.center,
                child: Row(children: []),
              ),
              // Video Slider And Controls
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 90,
                  child: Column(
                    children: [
                      // Video Slider
                      Row(
                        children: [
                          SizedBox(width: 24.w),
                          Text(
                            _videoService.position.toString().substring(0, 7),
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Expanded(
                            child: Slider(
                              min: 0,
                              max: _videoService.duration.inMilliseconds.toDouble(),
                              value: _videoService.position.inMilliseconds.toDouble(),
                              label: _videoService.formattedPosition,
                              divisions: _videoService.duration.inMilliseconds.toDouble() > 0
                                  ? _videoService.duration.inMilliseconds
                                  : null,
                              onChanged: (value) {
                                setState(() {});
                                _videoService.seekTo(Duration(milliseconds: value.toInt()));
                              },
                            ),
                          ),
                          Text(
                            _videoService.duration.toString().substring(0, 7),
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(width: 24.w),
                        ],
                      ),
                      // Video Controls
                      Row(children: []),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
