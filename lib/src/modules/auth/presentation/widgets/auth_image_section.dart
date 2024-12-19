import 'package:flutter/widgets.dart';
import 'package:socigate_system/src/core/constants/constants.dart';

import '../../../../core/animation/delayed_animation.dart';

class AuthImageSection extends StatelessWidget {
  const AuthImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DelayedAnimation(
        delay: 100,
        animationType: AnimationType.slideFromRight,
        child: Image.asset(
          AssetPaths.banner,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
