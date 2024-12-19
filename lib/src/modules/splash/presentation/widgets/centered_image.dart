import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenteredImage extends StatelessWidget {
  final String imagePath;
  final double width;

  const CenteredImage({
    super.key,
    required this.imagePath,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        imagePath,
        width: width.w,
      ),
    );
  }
}
