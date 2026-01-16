// External dependencies
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/application/cubits/video_cubit.dart';
import 'package:unyo/application/states/video_state.dart';

// Internal dependencies
import 'package:unyo/core/services/video/video_service.dart';

class UnyoVideoControls extends StatefulWidget {
  final VideoCubit videoCubit;
  final VideoService videoService;

  const UnyoVideoControls({super.key, required this.videoCubit, required this.videoService});

  @override
  State<UnyoVideoControls> createState() => _UnyoVideoControlsState();
}

class _UnyoVideoControlsState extends State<UnyoVideoControls> with TickerProviderStateMixin {
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
    _videoService = widget.videoService;
    _refreshTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (mounted && _videoService.isPlaying) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _refreshTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.videoCubit,
      child: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          return Stack(
            children: [
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
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: ColorScheme.of(context).tertiary,
                          ),
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
                          SizedBox(width: 20.w),
                          SizedBox(
                            width: 75,
                            child: Text(
                              _videoService.position.toString().substring(0, 7),
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                            ),
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
                                if (!mounted) return;
                                setState(() {});
                                _videoService.seekTo(Duration(milliseconds: value.toInt()));
                              },
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: Text(
                              _videoService.duration.toString().substring(0, 7),
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          SizedBox(width: 15.w),
                        ],
                      ),
                      // Video Controls
                      Row(children: []),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
