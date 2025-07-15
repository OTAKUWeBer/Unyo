import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkUnyoButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final bool isEnabled;
  final void Function() onPressed;

  const DarkUnyoButton({
    super.key,
    this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll( Size(100.w, 40.h)),
        backgroundColor: WidgetStatePropertyAll(
          const Color.fromARGB(255, 37, 37, 37),
        ),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
      onPressed: isEnabled ? onPressed : null,
      child: text != null ? Text(text!) : child ?? const SizedBox(),
    );
  }
}
