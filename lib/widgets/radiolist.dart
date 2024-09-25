import 'package:flutter/material.dart';

class Radiolist extends StatelessWidget {
  final int selectedRating;
  final ValueChanged<int?> onChanged;

  const Radiolist({
    super.key,
    required this.selectedRating, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround, 
      children: List.generate(5, (index) {
        int value = index + 1;
        return Expanded(
          child: RadioListTile<int>(
            title: Text('$value'),
            value: value,
            groupValue: selectedRating,
            onChanged: onChanged,
          ),
        );
      }),
    );
  }
}
