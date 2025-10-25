import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/presentation/widgets/styled/hover_animated_container.dart';

class UnyoEpisodeButton extends StatelessWidget {
  final String secondaryTitle;
  final String mainTitle;
  final String episodeImageUrl;
  final int episodeNumber;
  final int progress;
  final int released;
  final bool showDivider;

  const UnyoEpisodeButton({
    super.key,
    required this.mainTitle,
    required this.secondaryTitle,
    required this.episodeImageUrl,
    required this.episodeNumber,
    required this.progress,
    required this.released,
    required this.showDivider
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showDivider ? Divider(
            height: 0,
            thickness: 1,
            color: Colors.white,
            endIndent: 40.w,
            indent: 40.w,
          ) : const SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 12.h, top: showDivider ? 12.h : 0),
            child: HoverAnimatedContainer(
              duration: const Duration(milliseconds: 150),
              hoverHeight: 72.h,
              height: 70.h,
              width: double.infinity,
              hoverWidth: double.infinity,
              hoverCursor: SystemMouseCursors.click,
              decoration: const BoxDecoration(),
              hoverDecoration: const BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 105.w,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Opacity(
                            opacity: 0.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(episodeImageUrl, fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      SizedBox(
                        width: 120.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Tooltip(
                              message: mainTitle,
                              waitDuration: const Duration(milliseconds: 1500),
                              child: Text(
                                mainTitle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13
                                ),
                              ),
                            ),
                            Tooltip(
                              message: secondaryTitle,
                              waitDuration: const Duration(milliseconds: 1500),
                              child: Text(
                                secondaryTitle,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      progress >= episodeNumber
                          ? const Icon(Icons.check_rounded, color: Colors.grey)
                          : const SizedBox.shrink(),
                      SizedBox(width: 12.w),
                      Text(
                        released >= episodeNumber
                            ? context.tr("released")
                            : context.tr("not_yet_released"),
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                              released >= episodeNumber
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
