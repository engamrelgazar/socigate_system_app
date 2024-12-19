import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socigate_system/src/core/widgets/positioned_image.dart';
import 'package:socigate_system/src/modules/auth/presentation/widgets/delayed_logo_animation.dart';

class SuccessPage extends StatelessWidget {
  final VoidCallback goBack;

  const SuccessPage({super.key, required this.goBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DelayedLogoAnimation(),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 120.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/icons/success.png',
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'The password has been',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'changed ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                              ),
                              TextSpan(
                                text: 'successfully',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                          child: IconButton(
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: goBack,
                            icon: const Icon(Icons.arrow_back),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
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
      ),
    );
  }
}
