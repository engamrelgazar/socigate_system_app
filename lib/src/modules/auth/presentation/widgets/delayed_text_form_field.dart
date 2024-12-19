import 'package:flutter/material.dart';
import 'package:socigate_system/src/core/widgets/custom_text_field.dart';

import '../../../../core/animation/animation.dart';

class DelayedTextFormField extends StatelessWidget {
  const DelayedTextFormField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.obscureText = false,
      this.validator,
      this.animationType = AnimationType.fadeIn});

  final String labelText;
  final bool obscureText;
  final AnimationType animationType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
      delay: 600,
      animationType: animationType,
      child: CustomTextFormField(
        validator: validator,
        controller: controller,
        labelText: labelText,
        obscureText: obscureText,
      ),
    );
  }
}
