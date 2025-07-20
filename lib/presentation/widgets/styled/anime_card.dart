import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/presentation/widgets/styled/hover_animated_container.dart';

class AnimeCard extends StatelessWidget {
  final String title;
  final int score;
  final String coverImage;
  final void Function() onPressed;
  final String status;
  final String year;
  final String format;

  const AnimeCard({
    super.key,
    required this.title,
    required this.score,
    required this.coverImage,
    required this.onPressed,
    required this.status,
    required this.year,
    required this.format,
  });

  @override
  Widget build(BuildContext context) {
    return HoverAnimatedContainer(
      width: 124.08.w,
      hoverWidth: 136.49.w,
      height: 195.44.h,
      hoverHeight: 195.44.h,
      hoverCursor: SystemMouseCursors.click,
      decoration: BoxDecoration(),
      hoverDecoration: BoxDecoration(),
      margin: EdgeInsets.symmetric(horizontal: 6.4.w),
      hoverMargin: const EdgeInsets.symmetric(horizontal: 0),
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 170),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: onPressed,
            //TODO maybe Stack over HoverAnimatedContainer
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                HoverAnimatedContainer(
                  width: 128.w,
                  hoverWidth: 140.8,
                  height: 195.44.h,
                  hoverHeight: 195.44.h,
                  hoverDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: NetworkImage(coverImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                      image: NetworkImage(coverImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Opacity(
                          opacity: 0.8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorScheme.of(context).primary,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.r),
                                topLeft: Radius.circular(50.r),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "  ${(score / 10)}",
                                    style: TextStyle(
                                      color:
                                          ColorScheme.of(
                                                    context,
                                                  ).primary.computeLuminance() >
                                                  0.2
                                              ? Colors.black
                                              : Colors.white.withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color:
                                        ColorScheme.of(
                                                  context,
                                                ).primary.computeLuminance() >
                                                0.2
                                            ? Colors.black
                                            : Colors.white.withOpacity(0.8),
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 128.w,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4.0, left: 4.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: CircleAvatar(
                              backgroundColor:
                                  status == "RELEASING"
                                      ? Colors.green
                                      : status == "RELEASING"
                                      ? Colors.yellow
                                      : Colors.transparent,
                              maxRadius: 7.r,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 128.w,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 128.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: ColorScheme.of(context).tertiary.withOpacity(0.8),
                      size: 17,
                    ),
                    Text(
                      " ${year.split("/")[2]}",
                      style: TextStyle(
                        color: ColorScheme.of(
                          context,
                        ).tertiary.withOpacity(0.8),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${format.replaceAll("_", " ")} ",
                      style: TextStyle(
                        color: ColorScheme.of(
                          context,
                        ).tertiary.withOpacity(0.8),
                        overflow: TextOverflow.ellipsis,
                        fontSize:
                            format == "TV_SHORT" || format == "SPECIAL"
                                ? 10
                                : 14,
                      ),
                    ),
                    Icon(
                      Icons.tv_rounded,
                      color: ColorScheme.of(context).tertiary.withOpacity(0.8),
                      size: 17,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
