import 'package:flutter/material.dart';

class UnyoMenuIcon extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final void Function() onPressed;
  const UnyoMenuIcon({
    super.key,
    required this.isSelected,
    required this.icon,
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
            color: Colors.grey.withOpacity(.25),
            borderRadius: BorderRadius.circular(15.0),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedContainer(
                height: isSelected ? 33.0 : 0,
                duration: Duration(milliseconds: 200),
                width: 3.5,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255,132,120,168)
                ),
              ),
              SizedBox(width: isSelected ? 10.0 : 9.5),
              Icon(
                icon,
                color: const Color.fromARGB(255,132,120,168),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
