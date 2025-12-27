import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingView extends StatelessWidget {
  final double width;
  const LoadingView({super.key, this.width = 120});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Container(
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  'assets/logo.png',
                ),
                colorFilter:
                    ColorFilter.mode(ColorScheme.of(context).primary, BlendMode.modulate),
              ),
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 30),
        ),
      ],
    );
  }
}
