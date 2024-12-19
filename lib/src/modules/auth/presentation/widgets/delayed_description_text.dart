import 'package:flutter/material.dart';

import '../../../../core/animation/delayed_animation.dart';
import '../../../../core/constants/colors.dart';

class DelayedDescriptionText extends StatelessWidget {
  const DelayedDescriptionText(this.context, {super.key});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
      delay: 350,
      animationType: AnimationType.slideFromLeft,
      child: RichText(
        text: TextSpan(
          text: 'Continue your journey with ',
          style: Theme.of(context).textTheme.displaySmall,
          children: [
            TextSpan(
              text: 'socigate',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppColor.secondary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}