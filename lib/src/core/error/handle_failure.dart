import 'package:flutter/material.dart';
import 'package:socigate_system/src/core/error/failure.dart';
import 'package:socigate_system/src/core/utils/toast_manager.dart';

void handleFailure(BuildContext context, Failure failure) {
  if (failure is ServerFailure) {
    showCustomToast(context, failure.errorMessageModel.statusMessage);
  } else if (failure is GeneralFailure) {
    showCustomToast(context, failure.message);
  } else {
    showCustomToast(context, 'An unexpected error occurred');
  }
}
