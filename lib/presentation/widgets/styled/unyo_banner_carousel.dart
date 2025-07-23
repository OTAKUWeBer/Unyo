import 'package:flutter/material.dart';

class UnyoBannerCarousel extends StatelessWidget {
  final ScrollController controller;
  const UnyoBannerCarousel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
         ),
        )
      ],
    );
  }
}
