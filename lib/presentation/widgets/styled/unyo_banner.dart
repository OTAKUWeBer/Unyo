import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/presentation/widgets/styled/styled.dart';
import 'package:unyo/presentation/widgets/text/text_body_medium.dart';
import 'package:unyo/presentation/widgets/text/text_utils.dart';

class UnyoBanner extends StatelessWidget {
  final String imageUrl;
  final String duration;
  final String year;
  final String score;
  final String description;
  const UnyoBanner({super.key, required this.imageUrl, required this.duration, required this.year, required this.score, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: 800.w,
            height: 300.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                imageUrl != "" ? Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ) : const SizedBox.shrink(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
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
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UnyoBannerIcon(text: duration, iconData: Icons.timelapse_rounded),
                      UnyoBannerIcon(text: year, iconData: Icons.calendar_month_rounded),
                      UnyoBannerIcon(text: score, iconData: Icons.star),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: TextBodyMedium(
                      text: TextUtils.parseHtmlToPlainText(description),
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
