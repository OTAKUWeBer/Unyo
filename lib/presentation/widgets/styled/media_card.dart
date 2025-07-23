import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/presentation/widgets/styled/hover_animated_container.dart';

class MediaCard extends StatelessWidget {
  final String title;
  final int score;
  final String coverImage;
  final void Function() onPressed;
  final String status;
  final String year;
  final String format;
  final String tag;

  const MediaCard({
    super.key,
    required this.title,
    required this.score,
    required this.coverImage,
    required this.onPressed,
    required this.status,
    required this.year,
    required this.format,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: HoverAnimatedContainer(
        width: 144.08/*.w.clamp(144.08, 181.7)*/,
        hoverWidth: 156.49/*.w.clamp(156.49, 199.1)*/,
        height: 259.07/*.h.clamp(259.07, 342.7)*/,
        hoverHeight: 259.07/*.h.clamp(259.07, 342.7)*/,
        decoration: BoxDecoration(),
        hoverDecoration: BoxDecoration(),
        margin: EdgeInsets.symmetric(horizontal: 4.5.w),
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: onPressed,
              //TODO maybe Stack over HoverAnimatedContainer
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  HoverAnimatedContainer(
                    width: 144.08/*.w.clamp(144.08, 181.7)*/,
                    hoverWidth: 156.49/*.w.clamp(156.49, 199.1)*/,
                    height: 200.44/*.h.clamp(200.44, 260.6)*/,
                    hoverHeight: 206.03/*.h.clamp(206.03, 268.44)*/,
                    hoverCursor: SystemMouseCursors.click,
                    hoverDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                        image: NetworkImage(coverImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
                                  bottomRight: Radius.circular(50),
                                  topLeft: Radius.circular(50),
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
                                            ColorScheme.of(context).primary
                                                        .computeLuminance() >
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
                          // width: 128.w,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5.0, left: 5.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: CircleAvatar(
                                backgroundColor:
                                    status == "RELEASING"
                                        ? Colors.green
                                        : status == "RELEASING"
                                        ? Colors.yellow
                                        : Colors.transparent,
                                maxRadius: 8,
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
              width: 144.08/*.w.clamp(144.08, 181.7)*/,
              child: Center(
                child: Tooltip(
                  message: title,
                  waitDuration: Duration(milliseconds: 1000),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 144.08/*.w.clamp(144.08, 181.7)*/,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: ColorScheme.of(
                        context,
                      ).tertiary.withOpacity(0.8),
                      size: 17,
                    ),
                    Text(
                      " ${year.split("/")[2]}",
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorScheme.of(
                          context,
                        ).tertiary.withOpacity(0.8),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${format.replaceAll("_", " ")} ",
                      style: TextStyle(
                        color: ColorScheme.of(
                          context,
                        ).tertiary.withOpacity(0.8),
                        overflow: TextOverflow.ellipsis,
                        fontSize:
                            format == "TV_SHORT" || format == "SPECIAL" || format == "MANGA"
                                ? 10
                                : 14,
                      ),
                    ),
                    Icon(
                      Icons.tv_rounded,
                      color: ColorScheme.of(
                        context,
                      ).tertiary.withOpacity(0.8),
                      size: 17,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
