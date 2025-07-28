import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.transparent,
                      ColorScheme.of(context).primary.withValues(alpha: 140),
                    ],
                  ),
                ),
              ),
              // Glow overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topLeft,
                      radius: 0.7,
                      colors: [
                        ColorScheme.of(context).primary.withValues(alpha: 140),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Optional blur for softness
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 70.0, sigmaY: 70.0),
                  child: Container(color: Colors.transparent),
                ),
              ),
              AutoRouter()
            ]
        )
    );
  }
}
