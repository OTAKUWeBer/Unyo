import 'package:flutter/material.dart';

class UnyoMenuIcon extends StatelessWidget {
  final bool isSelected;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final void Function() onPressed;
  const UnyoMenuIcon({
    super.key,
    required this.isSelected,
    required this.unselectedIcon,
    required this.selectedIcon,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: 50.0,
          height: 50.0,
          // duration: Duration(milliseconds: 2000),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white.withOpacity(.10) : Colors.transparent,
            borderRadius: BorderRadius.circular(15.0),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedContainer(
                height: isSelected ? 33.0 : 0,
                duration: const Duration(milliseconds: 200),
                width: 3.5,
                decoration: BoxDecoration(
                  color: ColorScheme.of(context).tertiary,
                ),
              ),
              SizedBox(width: isSelected ? 10.0 : 9.5),
              Icon(
                isSelected ? selectedIcon : unselectedIcon,
                size: 27,
                color: isSelected ? ColorScheme.of(context).tertiary : Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
