// External dependencies
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class RootScaffoldScreen extends StatelessWidget {
  const RootScaffoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Back
      body: Stack(
        children: [
          // Gradient base
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // Color(0xFF1B132A),
                  // Color(0xFF3C2C5B),
                  Colors.transparent,
                  const Color.fromARGB(255, 82, 70, 118)
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
                    const Color.fromARGB(255,82,70,118),
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
          AutoRouter(),
        ],
      )
    );
  }
}
