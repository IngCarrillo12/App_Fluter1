import 'package:flutter/material.dart';

class CheckboxList extends StatelessWidget {
  final List<String> items; 
  final List<bool> selectedItems; 
  final ValueChanged<int> onChanged; 

  const CheckboxList({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        return CheckboxListTile(
          title: Text(items[index]),
          value: selectedItems[index],
          onChanged: (bool? newValue) {
            onChanged(index); 
          },
        );
      }),
    );
  }
}
