import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/animation/delayed_animation.dart';

class DelayedCustomButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final void Function()? onPressed;
  const DelayedCustomButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
      delay: 850,
      animationType: AnimationType.fadeIn,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15.h)),
          onPressed: onPressed,
          child: isLoading
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 9.w,
                  ),
                )
              : Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
        ),
      ),
    );
  }
}
