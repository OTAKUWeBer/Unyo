import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k3vinb5_aniyomi_bridge/jmodels/jvideo.dart';

class UnyoServerButton extends StatelessWidget {
  final JVideo videoServer;

  const UnyoServerButton({super.key, required this.videoServer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                        videoServer.getQuality().toDartString(),
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Icon(
                            RegExp(r'(720|1080)[pP]?').hasMatch(videoServer.getQuality().toDartString())
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
