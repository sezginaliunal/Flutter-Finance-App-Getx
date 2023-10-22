import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>>? items;
  final T? value;
  final Function(T?)? onChanged;

  const CustomDropdown({
    super.key,
    @required this.items,
    @required this.value,
    @required this.onChanged,
  });

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: widget.value,
      items: widget.items,
      onChanged: widget.onChanged,
    );
  }
}
