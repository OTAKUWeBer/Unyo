import 'package:flutter/material.dart';

class UnyoSlider extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final String title;
  final void Function(double) onChanged;

  const UnyoSlider({super.key, required this.minValue, required this.initialValue, required this.maxValue, required this.title, required this.onChanged});

  @override
  State<UnyoSlider> createState() => _UnyoSliderState();
}

class _UnyoSliderState extends State<UnyoSlider> {
  double _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 10),
            Text("${widget.minValue}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(width: 10),
            Expanded(
              child: Slider(
                value: _currentValue,
                min: widget.minValue.toDouble(),
                max: widget.maxValue.toDouble(),
                divisions: widget.maxValue - widget.minValue,
                label: "$_currentValue",
                activeColor: ColorScheme.of(context).tertiary,
                inactiveColor: ColorScheme.of(context).secondary.withOpacity(0.4),
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                  widget.onChanged(value);
                },
              ),
            ),
            const SizedBox(width: 10),
            Text(
              widget.maxValue.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
