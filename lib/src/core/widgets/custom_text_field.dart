import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabledBorder;
  final bool filled;
  final Icon? prefixIcon;
  final Color? fillColor;

  const CustomTextFormField(
      {super.key,
      this.labelText,
      this.hintText,
      required this.controller,
      this.validator,
      this.obscureText = false,
      this.enabledBorder = true,
      this.prefixIcon,
      this.filled = false,
      this.fillColor = const Color(0xffE7F0F8)});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        hintText: hintText,
        filled: filled,
        fillColor: fillColor,
        labelText: labelText,
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Colors.black),
        labelStyle: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: Colors.black),
        errorStyle:
            Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.red),
        border: enabledBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              )
            : noneBorder(),
        focusedErrorBorder: enabledBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              )
            : noneBorder(),
        errorBorder: enabledBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              )
            : noneBorder(),
        enabledBorder: enabledBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              )
            : noneBorder(),
      ),
      obscureText: obscureText,
    );
  }

  OutlineInputBorder noneBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(40.0),
    );
  }
}
