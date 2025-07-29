import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(child: Image.asset("assets/logo.png", scale: 1)),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 30),
        ),
      ],
    );
  }
}
