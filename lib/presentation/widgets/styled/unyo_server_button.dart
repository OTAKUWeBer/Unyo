import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/domain/entities/extension/video.dart' as ext;

class UnyoServerButton extends StatelessWidget {
  final ext.Video videoServer;
  final void Function()? onPressed;

  const UnyoServerButton({super.key, required this.videoServer, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.grey.withOpacity(0.3),
        ),
        height: 80.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videoServer.quality,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Icon(
                            RegExp(r'(720|1080)[pP]?').hasMatch(videoServer.quality)
                                ? Icons.hd
                                : Icons.sd,
                            color: ColorScheme.of(context).tertiary,
                          ),
                          IconButton(
                            onPressed: () {},
                            color: ColorScheme.of(context).tertiary,
                            iconSize: 22,
                            icon: const Icon(Icons.star_border_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.play_circle_outline_rounded, size: 35.h),
            ],
          ),
        ),
      ),
    );
  }
}
