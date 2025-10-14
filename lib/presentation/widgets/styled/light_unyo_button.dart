import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightUnyoButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final bool isEnabled;
  final void Function() onPressed;

  const LightUnyoButton({
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
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        foregroundColor: const WidgetStatePropertyAll(
          Color.fromARGB(255, 37, 37, 37),
        ),
      ),
      onPressed: isEnabled ? onPressed : null,
      child: text != null ? Text(text!) : child ?? const SizedBox(),
    );
  }
}
