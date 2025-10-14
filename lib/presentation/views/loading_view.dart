import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Container(
            width: 120,
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
