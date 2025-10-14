import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnyoDropdown extends StatelessWidget {
  final double width;
  final double height;
  final void Function(int)? onPressed;
  final int selected;
  final List<Widget> children;
  const UnyoDropdown({super.key, required this.children, required this.selected, required this.onPressed, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorScheme.of(context).tertiary),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: SizedBox(
        width: width,
        height: height,
        child: DropdownButton(
          padding: const EdgeInsets.only(left: 10),
          style: const TextStyle(
            color: Colors.white,
          ),
          dropdownColor: const Color.fromARGB(255, 46, 45, 46),
          focusColor: Colors.transparent,
          underline: const SizedBox(),
          value: selected,
          items: [
            ...children.mapIndexed(
              (index, widgets) {
                return DropdownMenuItem(
                  value: index,
                  child: widgets,
                );
              },
            ),
          ],
          onChanged: (index) {
            if (index != null && onPressed != null) {
              onPressed!(index);
            }
          },
        ),
      ),
    );
  }
}
