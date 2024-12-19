import 'package:flutter/material.dart';

import '../../../../core/animation/delayed_animation.dart';

class DelayedSignInText extends StatelessWidget {
  const DelayedSignInText({super.key});

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
      delay: 250,
      animationType: AnimationType.slideFromLeft,
      child: Text(
        "Sign in",
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
