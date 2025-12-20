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
        child: Text(
            videoServer.getQuality().toDartString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
            )
        ),
      ),
    );
  }
}
