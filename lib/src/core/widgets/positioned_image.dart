import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionedImage extends StatefulWidget {
  final String imagePath;
  final double? initialTop;
  final double? initialLeft;
  final double? initialBottom;
  final double? initialRight;
  final double? finalTop;
  final double? finalLeft;
  final double? finalBottom;
  final double? finalRight;
  final double width;
  final int delay;

  const PositionedImage({
    super.key,
    required this.imagePath,
    this.initialTop,
    this.initialLeft,
    this.initialBottom,
    this.initialRight,
    this.finalTop,
    this.finalLeft,
    this.finalBottom,
    this.finalRight,
    this.width = 90,
    this.delay = 1000,
  });

  @override
  PositionedImageState createState() => PositionedImageState();
}

class PositionedImageState extends State<PositionedImage> {
  bool _isPositioned = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.delay), () {
      setState(() {
        _isPositioned = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: _isPositioned ? widget.finalTop?.h : widget.initialTop?.h,
      left: _isPositioned ? widget.finalLeft?.w : widget.initialLeft?.w,
      bottom: _isPositioned ? widget.finalBottom?.h : widget.initialBottom?.h,
      right: _isPositioned ? widget.finalRight?.w : widget.initialRight?.w,
      duration: const Duration(seconds: 1), 
      curve: Curves.easeInOut,
      child: Image.asset(
        widget.imagePath,
        width: widget.width.w,
      ),
    );
  }
}
