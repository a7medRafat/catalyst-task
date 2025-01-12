import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/core/utils/vContainer.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final String hintText;
  final List<T> items;
  final T? value;
  final Function(T?)? onChanged;
  final Widget Function(T) text;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    required this.text,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final uniqueItems = widget.items.toSet().toList();

    return AppContainer(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
        hint: Text(widget.hintText, style: AppFonts.bodyText2),
        value: uniqueItems.contains(selectedValue) ? selectedValue : null,
        onChanged: (newValue) {
          setState(() {
            selectedValue = newValue;
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          });
        },
        items: uniqueItems.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: widget.text(item),
          );
        }).toList(),
      ),
    );
  }
}
