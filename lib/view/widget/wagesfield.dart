import 'package:flutter/material.dart';
import 'package:project_structure/constants/app_colors.dart';

class Wagesfield extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final ValueChanged<String>? onChanged;

  const Wagesfield({
    Key? key,
    required this.hintText,
    required this.inputType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: kGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kBlueColor, width: 1.5),
        ),
      ),
    );
  }
}
