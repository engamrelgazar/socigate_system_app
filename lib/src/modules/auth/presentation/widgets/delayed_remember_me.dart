import 'package:flutter/material.dart';

import '../../../../core/animation/delayed_animation.dart';




class DelayedRememberMe extends StatelessWidget {
  final VoidCallback onForgotPassword;
   final AnimationType animationType;
  const DelayedRememberMe({super.key, required this.onForgotPassword,this.animationType = AnimationType.fadeIn});

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
      delay: 800,
      animationType: animationType,
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (value) {}),
          Text(
            "Remember me",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const Spacer(),
          TextButton(
              onPressed: onForgotPassword,
              child: const Text("Forgot password?")),
        ],
      ),
    );
  }
}
