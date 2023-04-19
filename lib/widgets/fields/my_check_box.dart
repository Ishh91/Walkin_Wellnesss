import 'package:flutter/material.dart';

import '/app_styles.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({super.key, required this.text});

  final String text;

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: kPrimaryColor,
            checkColor: kSecondaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            }),
        Text(
          widget.text,
          style: kBodyText3,
        )
      ],
    );
  }
}
