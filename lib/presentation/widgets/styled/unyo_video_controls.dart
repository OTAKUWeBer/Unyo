// External dependencies
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late AnimationController _fadeController;
  late Timer _refreshTimer;
  late VideoService _videoService;
  Timer? _hideControlsTimer;
  bool _controlsVisible = true;
  double _currentVolume = 1.0;
  double _playbackSpeed = 1.0;
  bool _showSkipOverlay = false;
  String _skipOverlayText = '';
  Timer? _skipOverlayTimer;
  bool _isPlaying = false;
  bool _isDraggingSlider = false;
  double _dragValue = 0.0;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 1.0,
    );
    _videoService = widget.videoService;
    _isPlaying = _videoService.isPlaying;
    
    // Refresh UI periodically to sync with video state
    _refreshTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (mounted) {
        final currentlyPlaying = _videoService.isPlaying;
        if (_isPlaying != currentlyPlaying || currentlyPlaying) {
          setState(() {
            _isPlaying = currentlyPlaying;
          });
        }
      }
    });
    _resetHideTimer();
    
    // Request focus for keyboard shortcuts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _refreshTimer.cancel();
    _hideControlsTimer?.cancel();
    _skipOverlayTimer?.cancel();
    _controller.dispose();
    _fadeController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _resetHideTimer() {
    _hideControlsTimer?.cancel();
    if (_isPlaying) {
      _hideControlsTimer = Timer(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _controlsVisible = false;
            _fadeController.reverse();
          });
        }
      });
    }
  }

  void _showControls() {
    if (!_controlsVisible) {
      setState(() {
        _controlsVisible = true;
        _fadeController.forward();
      });
    }
    _resetHideTimer();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _videoService.pause();
        _isPlaying = false;
      } else {
        _videoService.play();
        _isPlaying = true;
      }
    });
    _showControls();
  }

  void _skipSeconds(int seconds) {
    final currentPos = _videoService.position.inMilliseconds;
    final maxDuration = _videoService.duration.inMilliseconds;
    if (maxDuration <= 0) return;
    
    final newPosition = (currentPos + (seconds * 1000)).clamp(0, maxDuration);
    _videoService.seekTo(Duration(milliseconds: newPosition));
    
    _showSkipIndicator(seconds > 0 ? '+$seconds s' : '$seconds s');
    _showControls();
  }

  void _showSkipIndicator(String text) {
    setState(() {
      _showSkipOverlay = true;
      _skipOverlayText = text;
    });
    
    _skipOverlayTimer?.cancel();
    _skipOverlayTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _showSkipOverlay = false;
        });
      }
    });
  }

  void _changeVolume(double delta) {
    setState(() {
      _currentVolume = (_currentVolume + delta).clamp(0.0, 1.0);
    });
    _videoService.setVolume(_currentVolume);
    _showSkipIndicator('Volume: ${(_currentVolume * 100).round()}%');
    _showControls();
  }

  void _changePlaybackSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
    });
    _videoService.setPlaybackSpeed(speed);
    _showSkipIndicator('Speed: ${speed}x');
    _showControls();
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _exitVideo() {
    _videoService.pause();
    if (mounted && Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  void _handleKeyPress(KeyEvent event) {
    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.escape:
          _exitVideo();
          break;
        case LogicalKeyboardKey.space:
        case LogicalKeyboardKey.keyK:
          _togglePlayPause();
          break;
        case LogicalKeyboardKey.arrowRight:
          _skipSeconds(5);
          break;
        case LogicalKeyboardKey.arrowLeft:
          _skipSeconds(-5);
          break;
        case LogicalKeyboardKey.keyJ:
          _skipSeconds(-10);
          break;
        case LogicalKeyboardKey.keyL:
          _skipSeconds(10);
          break;
        case LogicalKeyboardKey.arrowUp:
          _changeVolume(0.1);
          break;
        case LogicalKeyboardKey.arrowDown:
          _changeVolume(-0.1);
          break;
        case LogicalKeyboardKey.keyM:
          _videoService.toggleMute();
          setState(() {});
          _showSkipIndicator(_videoService.isMuted ? 'Muted' : 'Unmuted');
          _showControls();
          break;
        case LogicalKeyboardKey.keyF:
          _videoService.toggleFullscreen();
          _showControls();
          break;
        case LogicalKeyboardKey.digit0:
        case LogicalKeyboardKey.numpad0:
          _videoService.seekTo(Duration.zero);
          _showControls();
          break;
        case LogicalKeyboardKey.comma:
          if (_playbackSpeed > 0.25) {
            _changePlaybackSpeed((_playbackSpeed - 0.25).clamp(0.25, 2.0));
          }
          break;
        case LogicalKeyboardKey.period:
          if (_playbackSpeed < 2.0) {
            _changePlaybackSpeed((_playbackSpeed + 0.25).clamp(0.25, 2.0));
          }
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.videoCubit,
      child: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          return KeyboardListener(
            focusNode: _focusNode,
            onKeyEvent: _handleKeyPress,
            child: GestureDetector(
              onTap: () {
                if (_controlsVisible) {
                  setState(() {
                    _controlsVisible = false;
                    _fadeController.reverse();
                  });
                  _hideControlsTimer?.cancel();
                } else {
                  _showControls();
                }
              },
              child: MouseRegion(
                onHover: (_) => _showControls(),
                child: Container(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      // Skip Overlay
                      if (_showSkipOverlay)
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _skipOverlayText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      
                      // Controls
                      FadeTransition(
                        opacity: _fadeController,
                        child: Stack(
                          children: [
                            // Header
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
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
                                      Expanded(
                                        child: Text(
                                          "${state.selectedAnime.title.userPreferred}  -  Episode ${state.videoInfo.playlistIndex + 1}",
                                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            
                            // Center Play/Pause Button
                            Center(
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                transitionBuilder: (child, animation) {
                                  return ScaleTransition(scale: animation, child: child);
                                },
                                child: IconButton(
                                  key: ValueKey<bool>(_isPlaying),
                                  onPressed: _togglePlayPause,
                                  iconSize: 72,
                                  icon: Icon(
                                    _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                                    color: Colors.white.withOpacity(0.9),
                                    shadows: const [
                                      Shadow(blurRadius: 20, color: Colors.black54),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            
                            // Bottom Controls
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Video Slider
                                    Builder(
                                      builder: (context) {
                                        final duration = _videoService.duration.inMilliseconds.toDouble();
                                        final position = _videoService.position.inMilliseconds.toDouble();
                                        
                                        // Ensure max is at least 1 to avoid slider issues
                                        final maxValue = duration > 0 ? duration : 1.0;
                                        // Clamp position to valid range and use drag value when dragging
                                        final sliderValue = _isDraggingSlider 
                                            ? _dragValue.clamp(0.0, maxValue)
                                            : position.clamp(0.0, maxValue);
                                        
                                        return Row(
                                          children: [
                                            SizedBox(width: 20.w),
                                            SizedBox(
                                              width: 80,
                                              child: Text(
                                                _isDraggingSlider 
                                                    ? _formatDuration(Duration(milliseconds: _dragValue.toInt()))
                                                    : _formatDuration(_videoService.position),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(color: Colors.white, fontSize: 14),
                                              ),
                                            ),
                                            Expanded(
                                              child: SliderTheme(
                                                data: SliderThemeData(
                                                  trackHeight: 4,
                                                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                                                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                                                  activeTrackColor: Theme.of(context).colorScheme.primary,
                                                  inactiveTrackColor: Colors.white.withOpacity(0.3),
                                                  thumbColor: Theme.of(context).colorScheme.primary,
                                                  overlayColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                                                ),
                                                child: Slider(
                                                  min: 0,
                                                  max: maxValue,
                                                  value: sliderValue,
                                                  onChangeStart: (value) {
                                                    setState(() {
                                                      _isDraggingSlider = true;
                                                      _dragValue = value;
                                                    });
                                                    _hideControlsTimer?.cancel();
                                                  },
                                                  onChanged: (value) {
                                                    if (!mounted) return;
                                                    setState(() {
                                                      _dragValue = value;
                                                    });
                                                  },
                                                  onChangeEnd: (value) {
                                                    if (!mounted) return;
                                                    _videoService.seekTo(Duration(milliseconds: value.toInt()));
                                                    setState(() {
                                                      _isDraggingSlider = false;
                                                    });
                                                    _showControls();
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 80,
                                              child: Text(
                                                _formatDuration(_videoService.duration),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(color: Colors.white, fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(width: 15.w),
                                          ],
                                        );
                                      },
                                    ),
                                    
                                    // Video Control Buttons
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: _togglePlayPause,
                                            icon: AnimatedSwitcher(
                                              duration: const Duration(milliseconds: 150),
                                              child: Icon(
                                                _isPlaying ? Icons.pause : Icons.play_arrow,
                                                key: ValueKey<bool>(_isPlaying),
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () => _skipSeconds(-10),
                                            icon: const Icon(Icons.replay_10, color: Colors.white, size: 24),
                                          ),
                                          IconButton(
                                            onPressed: () => _skipSeconds(10),
                                            icon: const Icon(Icons.forward_10, color: Colors.white, size: 24),
                                          ),
                                          // Volume slider
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  _videoService.toggleMute();
                                                  setState(() {
                                                    if (_videoService.isMuted) {
                                                      _currentVolume = 0.0;
                                                    } else {
                                                      _currentVolume = _videoService.volume > 0 ? _videoService.volume : 1.0;
                                                    }
                                                  });
                                                },
                                                icon: Icon(
                                                  _videoService.isMuted || _currentVolume == 0
                                                      ? Icons.volume_off
                                                      : _currentVolume < 0.5
                                                          ? Icons.volume_down
                                                          : Icons.volume_up,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 80,
                                                child: SliderTheme(
                                                  data: SliderThemeData(
                                                    trackHeight: 3,
                                                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                                                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
                                                    activeTrackColor: Colors.white,
                                                    inactiveTrackColor: Colors.white.withOpacity(0.3),
                                                    thumbColor: Colors.white,
                                                  ),
                                                  child: Slider(
                                                    min: 0,
                                                    max: 1,
                                                    value: _currentVolume,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _currentVolume = value;
                                                      });
                                                      _videoService.setVolume(value);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          // Playback Speed indicator
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              '${_playbackSpeed}x',
                                              style: const TextStyle(color: Colors.white, fontSize: 12),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          // Playback Speed
                                          PopupMenuButton<double>(
                                            icon: const Icon(Icons.speed, color: Colors.white, size: 24),
                                            tooltip: 'Playback Speed',
                                            onSelected: _changePlaybackSpeed,
                                            itemBuilder: (context) => [
                                              PopupMenuItem(value: 0.25, child: Text('0.25x', style: TextStyle(fontWeight: _playbackSpeed == 0.25 ? FontWeight.bold : FontWeight.normal))),
                                              PopupMenuItem(value: 0.5, child: Text('0.5x', style: TextStyle(fontWeight: _playbackSpeed == 0.5 ? FontWeight.bold : FontWeight.normal))),
                                              PopupMenuItem(value: 0.75, child: Text('0.75x', style: TextStyle(fontWeight: _playbackSpeed == 0.75 ? FontWeight.bold : FontWeight.normal))),
                                              PopupMenuItem(value: 1.0, child: Text('1.0x (Normal)', style: TextStyle(fontWeight: _playbackSpeed == 1.0 ? FontWeight.bold : FontWeight.normal))),
                                              PopupMenuItem(value: 1.25, child: Text('1.25x', style: TextStyle(fontWeight: _playbackSpeed == 1.25 ? FontWeight.bold : FontWeight.normal))),
                                              PopupMenuItem(value: 1.5, child: Text('1.5x', style: TextStyle(fontWeight: _playbackSpeed == 1.5 ? FontWeight.bold : FontWeight.normal))),
                                              PopupMenuItem(value: 1.75, child: Text('1.75x', style: TextStyle(fontWeight: _playbackSpeed == 1.75 ? FontWeight.bold : FontWeight.normal))),
                                              PopupMenuItem(value: 2.0, child: Text('2.0x', style: TextStyle(fontWeight: _playbackSpeed == 2.0 ? FontWeight.bold : FontWeight.normal))),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () => _videoService.toggleFullscreen(),
                                            icon: const Icon(Icons.fullscreen, color: Colors.white, size: 28),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
