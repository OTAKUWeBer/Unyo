import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unyo/presentation/widgets/styled/styled.dart';

class MediaButton extends StatelessWidget {
  final void Function() onPressed;
  final String image;
  final String text;
  const MediaButton({super.key, required this.onPressed, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
        return InkWell(
            onTap: onPressed,
            child: HoverAnimatedContainer(
              duration: const Duration(milliseconds: 130),
              alignment: Alignment.center,
              width: 300.w.clamp(250, 310),
              hoverWidth: 310.w.clamp(260, 320),
              height: 80.h.clamp(70, 90),
              hoverHeight: 85.h.clamp(75, 95),
              hoverCursor: SystemMouseCursors.click,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.transparent, Colors.black87],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                border: Border.all(
                    color: ColorScheme.of(context).secondary.withOpacity(0.4), width: 2),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  opacity: 0.35,
                  colorFilter:
                      ColorFilter.mode(ColorScheme.of(context).secondary, BlendMode.modulate),
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              hoverDecoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.transparent, Colors.black87],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                border: Border.all(
                    color: ColorScheme.of(context).secondary.withOpacity(0.4), width: 2),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  opacity: 0.35,
                  colorFilter:
                      ColorFilter.mode(ColorScheme.of(context).primary, BlendMode.modulate),
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 2,
                    color: ColorScheme.of(context).primary,
                  ),
                ],
              ),
            ),
          );
  }
}
