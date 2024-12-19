import 'package:flutter/material.dart';

enum AnimationType {
  fadeIn,
  slideFromLeft,
  slideFromRight,
  slideFromTop,
  slideFromBottom,
}

class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  final AnimationType animationType;

  const DelayedAnimation({
    super.key,
    required this.child,
    this.delay = 2000,
    this.animationType = AnimationType.fadeIn,
  });

  @override
  DelayedAnimationState createState() => DelayedAnimationState();
}

class DelayedAnimationState extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _slideAnimation = Tween<Offset>(
      begin: _getBeginOffset(widget.animationType),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  Offset _getBeginOffset(AnimationType type) {
    switch (type) {
      case AnimationType.slideFromLeft:
        return const Offset(-1, 0);
      case AnimationType.slideFromRight:
        return const Offset(1, 0);
      case AnimationType.slideFromTop:
        return const Offset(0, -1);
      case AnimationType.slideFromBottom:
        return const Offset(0, 1);
      default:
        return Offset.zero;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        switch (widget.animationType) {
          case AnimationType.fadeIn:
            return FadeTransition(
              opacity: _fadeInAnimation,
              child: child,
            );
          case AnimationType.slideFromLeft:
          case AnimationType.slideFromRight:
          case AnimationType.slideFromTop:
          case AnimationType.slideFromBottom:
            return SlideTransition(
              position: _slideAnimation,
              child: child,
            );
          default:
            return child!;
        }
      },
      child: widget.child,
    );
  }
}
