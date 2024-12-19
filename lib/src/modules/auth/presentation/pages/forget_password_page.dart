import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:socigate_system/src/modules/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/widgets/widgets.dart';
import '../widgets/widgets.dart';

class ForgetPasswordPage extends StatefulWidget {
  final VoidCallback onBackToLogin;
  const ForgetPasswordPage({super.key, required this.onBackToLogin});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final emailController = TextEditingController();
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
                Text(
                  "Forget password",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "To get you back to your account, please enter your email",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(height: 40.h),
                CustomTextFormField(
                  controller: emailController,
                  labelText: 'Email',
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
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: widget.onBackToLogin,
                    child: const Text("Back to login"),
                  ),
                ),
                SizedBox(height: 20.h),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    bool isLoading = state is AuthLoadingState;
                    return DelayedCustomButton(
                      label: "Send",
                      isLoading: isLoading,
                      onPressed: isLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                final email = emailController.text;
                                context.read<AuthBloc>().add(
                                      ForgetPasswordRequested(email: email),
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
          delay: 600,
        ),
      ],
    );
  }
}
