import 'package:flutter/material.dart';
import 'package:unyo/core/services/video/video_service.dart';

class UnyoVideoTexture extends StatefulWidget {
  final VideoService videoService;
  const UnyoVideoTexture({super.key, required this.videoService});

  @override
  State<UnyoVideoTexture> createState() => _UnyoVideoTextureState();
}

class _UnyoVideoTextureState extends State<UnyoVideoTexture> {
  late VideoService _videoService;
  @override
  void initState() {
    super.initState();
    _videoService = widget.videoService;
    _videoService.updateTexture();
  }

  @override
  void dispose() {
    // Only updates texture on init; nothing to clean up, but keep method for symmetry/debug hooks.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder<int?>(
            valueListenable: _videoService.textureId,
            builder: (context, id, _) => id == null ? const SizedBox.shrink() : Texture(textureId: id),
          ),
        ),
      ],
    );
  }
}
