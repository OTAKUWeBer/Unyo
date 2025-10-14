// External dependencies
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Internal dependencies
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/presentation/widgets/styled/hover_animated_container.dart';
import 'package:unyo/presentation/widgets/text/text_headline_large.dart';

class AddUserAvatar extends StatelessWidget {
  final void Function() onPressed;

  const AddUserAvatar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: Column(
        children: [
          HoverAnimatedContainer(
            width: 0.25.sh,
            height: 0.25.sh,
            hoverWidth: 0.27.sh,
            hoverHeight: 0.27.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(140.r),
              border: Border.all(color: Colors.white, width: 3.w),
            ),
            hoverDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150.r),
              border: Border.all(color: Colors.white, width: 8.w),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(140.r),
              onTap: onPressed,
              child: CircleAvatar(
                radius: 0.125.sh,
                backgroundColor: Colors.transparent,
                backgroundImage: const NetworkImage(config.plusImageUrl),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerLeft,
            child: TextHeadlineLarge(text: context.tr("add_account")),
          ),
        ],
      ),
    );
  }
}
