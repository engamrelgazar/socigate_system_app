import 'package:flutter/material.dart';
import 'package:socigate_system/src/core/constants/constants.dart';

import '../../../../core/animation/delayed_animation.dart';

class DelayedLogoAnimation extends StatelessWidget {
  const DelayedLogoAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
      delay: 150,
      animationType: AnimationType.slideFromTop,
      child: Image.asset(AssetPaths.logo),
    );
  }
}
