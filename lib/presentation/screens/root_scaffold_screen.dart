//Flutter dependencies
import 'package:flutter/material.dart';

//External dependencies
import 'package:auto_route/auto_route.dart';

@RoutePage()
class RootScaffoldScreen extends StatelessWidget {
  const RootScaffoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Back
      body: AutoRouter(),
    );
  }
}
