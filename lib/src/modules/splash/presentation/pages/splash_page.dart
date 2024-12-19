import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:socigate_system/src/core/animation/delayed_animation.dart';
import 'package:socigate_system/src/core/routes/routes.dart';
import 'package:socigate_system/src/modules/splash/presentation/bloc/splash_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../widgets/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: BlocProvider(
        create: (_) => SplashBloc()..add(CheckLoginEvent()),
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            _handleNavigation(context, state);
          },
          child: splashContent(),
        ),
      ),
    );
  }

  Widget splashContent() {
    return Stack(
      children: [
        const PositionedImage(
          imagePath: 'assets/images/top_left_image.png',
          initialTop: -100,
          initialLeft: -100,
          finalTop: -10,
          finalLeft: -10,
          delay: 1000,
        ),
        const PositionedImage(
          imagePath: 'assets/images/bottom_right_image.png',
          initialBottom: -100,
          initialRight: -100,
          finalBottom: -10,
          finalRight: -10,
          delay: 1800,
        ),
        DelayedAnimation(
          delay: 2200,
          animationType: AnimationType.fadeIn,
          child: CenteredImage(
            imagePath: AssetPaths.whiteLogo,
            width: 200.w,
          ),
        ),
      ],
    );
  }

  void _handleNavigation(BuildContext context, SplashState state) {
    if (state is SplashAuthenticated) {
      context.go(RoutesName.dashboard);
    } else if (state is SplashUnauthenticated) {
      context.go(RoutesName.login);
    }
  }
}
