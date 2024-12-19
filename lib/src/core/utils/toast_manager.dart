import 'package:flutter/material.dart';
import 'package:socigate_system/src/core/widgets/custom_toast.dart';

void showCustomToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 10,
      right: 10,
      child: CustomToast(message: message),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3)).then((_) {
    overlayEntry.remove();
  });
}
