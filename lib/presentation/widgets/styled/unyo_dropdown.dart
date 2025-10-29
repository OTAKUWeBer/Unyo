import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class UnyoDropdown extends StatefulWidget {
  final void Function(String?)? onPressed;
  final List<String> children;
  final double? width;
  final IconData? icon;
  final String? label;
  final String? selectedValue;

  const UnyoDropdown({
    super.key,
    required this.children,
    this.width,
    this.icon,
    required this.label,
    required this.onPressed,
    this.selectedValue
  });

  @override
  State<UnyoDropdown> createState() => _UnyoDropdownState();
}

class _UnyoDropdownState extends State<UnyoDropdown> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    if (widget.selectedValue != null) {
    searchController.text = widget.selectedValue!;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UnyoDropdown oldWidget) {
    if(oldWidget.selectedValue != widget.selectedValue) {
      setState(() {
        searchController.text = widget.selectedValue!;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:
          (context, constrains) => DropdownMenu(
            width: widget.width ?? constrains.maxWidth,
            controller: searchController,
            onSelected: widget.onPressed,
            leadingIcon: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 8.0),
              child: Icon(widget.icon ?? Icons.search_rounded, color: ColorScheme.of(context).tertiary.withOpacity(0.7)),
            ),
            enableFilter: true,
            trailingIcon: Icon(
              Icons.arrow_drop_down,
              color: ColorScheme.of(context).tertiary.withOpacity(0.7),
            ),
            menuStyle: MenuStyle(
              backgroundColor: WidgetStatePropertyAll(ColorScheme.of(context).secondary.withOpacity(0.8)),
              maximumSize: WidgetStatePropertyAll(Size(constrains.maxWidth, 300)),
            ),
            label: widget.label != null ? Text(widget.label!, style: TextStyle(color: Colors.white.withOpacity(0.8))) : null,
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: ColorScheme.of(context).primary, width: 3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: ColorScheme.of(context).tertiary.withOpacity(0.8), width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            ),
            dropdownMenuEntries:
                widget.children
                    .mapIndexed(
                      (index, element) => DropdownMenuEntry<String>(
                        value: element,
                        label: element,
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    )
                    .toList(),
          ),
    );
  }
}
