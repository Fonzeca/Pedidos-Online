import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
    this.trailing
  });

  final String label;
  final EdgeInsets padding;
  final int groupValue;
  final int value;
  final Function onChanged;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<int>(
              groupValue: groupValue,
              value: value,
              onChanged: (int newValue) {
                onChanged(newValue);
              },
            ),
            Text(label),
            Expanded(child: Text(
              trailing,
              textAlign: TextAlign.end,
            ))
          ],
        ),
      ),
    );
  }
}