import 'package:flutter/material.dart';

class CustomDropMenu extends StatefulWidget {
  final String label;
  final String? hint;
  final Icon? icon;
  final List<String> items;
  final String? dropdownDefaultValue;
  final bool? isExpanded;

  const CustomDropMenu({
    super.key,
    this.label = "Email",
    this.hint,
    this.icon,
    this.dropdownDefaultValue,
    this.items = const ['Banasree', 'Item 2', 'Item 3'],
    this.isExpanded = true,
  });

  @override
  State<CustomDropMenu> createState() => _CustomDropMenuState();
}

class _CustomDropMenuState extends State<CustomDropMenu> {
  @override
  Widget build(BuildContext context) {
    String selectedValue = widget.dropdownDefaultValue ?? widget.items[0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        DropdownButton(
          isExpanded: true,
          // Initial Value
          value: widget.hint != null ? null : selectedValue,
          hint: widget.hint == null
              ? null
              : Text(
                  widget.hint!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

          // Down Arrow Icon
          icon:
              widget.isExpanded! ? const Icon(Icons.keyboard_arrow_down) : null,
          style: Theme.of(context).textTheme.titleMedium,

          // Array list of items
          items: widget.items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(
              () {
                selectedValue = newValue!;
              },
            );
          },
        ),
      ],
    );
  }
}
