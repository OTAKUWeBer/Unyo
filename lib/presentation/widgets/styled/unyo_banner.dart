import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/presentation/widgets/text/text_body_medium.dart';
import 'package:unyo/presentation/widgets/text/text_label_large.dart';
import 'package:unyo/presentation/widgets/text/text_title_small.dart';

class UnyoBanner extends StatelessWidget {
  const UnyoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: 800.w,
            height: 250.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // The image
                Image.network(
                  "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114124-44utnIatIX16.jpg",
                  fit: BoxFit.cover,
                ),

                // Dark overlay
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    // Adjust opacity as needed
                    // Optional: add gradient for more dramatic effect
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextTitleSmall(
                    text: "Anime name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 50,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.star,
                          color: ColorScheme.of(context).tertiary,
                          size: 17,
                        ),
                        TextLabelLarge(
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          text: 10.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextBodyMedium(
                      text: "description",
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
