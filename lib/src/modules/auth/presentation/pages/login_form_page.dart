import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:socigate_system/src/core/widgets/positioned_image.dart';
import 'package:socigate_system/src/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:socigate_system/src/modules/auth/presentation/widgets/widgets.dart';

import '../../../../core/animation/delayed_animation.dart';

const _defaultAnimationType = AnimationType.fadeIn;

class LoginFormPage extends StatefulWidget {
  final VoidCallback onForgotPassword;

  const LoginFormPage({super.key, required this.onForgotPassword});

  @override
  State<LoginFormPage> createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 15.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DelayedLogoAnimation(),
                SizedBox(height: 20.h),
                const DelayedSignInText(),
                SizedBox(height: 20.h),
                DelayedDescriptionText(context),
                SizedBox(height: 40.h),
                DelayedTextFormField(
                  validator: (value) {
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  controller: emailController,
                  animationType: _defaultAnimationType,
                  labelText: 'Email',
                ),
                SizedBox(height: 20.h),
                DelayedTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    if (value.length > 16) {
                      return 'Password must not exceed 16 characters';
                    }
                    return null;
                  },
                  controller: passwordController,
                  animationType: _defaultAnimationType,
                  labelText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 10.h),
                DelayedRememberMe(onForgotPassword: widget.onForgotPassword),
                SizedBox(height: 20.h),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    bool isLoading = state is AuthLoadingState;
                    return DelayedCustomButton(
                      label: "Login",
                      isLoading: isLoading,
                      onPressed: isLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                final email = emailController.text;
                                final password = passwordController.text;
                                context.read<AuthBloc>().add(
                                      LoginRequested(
                                          email: email, password: password),
                                    );
                              }
                            },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const PositionedImage(
          imagePath: 'assets/images/bottom_left_image.png',
          initialBottom: -100,
          initialLeft: -100,
          finalBottom: -10,
          finalLeft: -10,
          delay: 1500,
        ),
      ],
    );
  }
}
