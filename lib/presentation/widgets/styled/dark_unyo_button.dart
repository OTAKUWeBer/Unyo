import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkUnyoButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Color color;
  final bool isEnabled;
  final void Function() onPressed;

  const DarkUnyoButton({
    super.key,
    this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.child,
    this.color = const Color.fromARGB(255, 37, 37, 37),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll( Size(75.w, 40.h)),
        backgroundColor: WidgetStatePropertyAll(
          color,
        ),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
      onPressed: isEnabled ? onPressed : null,
      child: text != null ? Text(text!, style: TextStyle(fontSize: 10.sp),) : child ?? const SizedBox(),
    );
  }
}
