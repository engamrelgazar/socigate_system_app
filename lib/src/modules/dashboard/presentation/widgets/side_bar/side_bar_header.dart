import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/assets_paths.dart';

class SidebarHeader extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const SidebarHeader(
      {required this.isExpanded, required this.onToggle, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: isExpanded
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          if (isExpanded)
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  AssetPaths.logo,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
          IconButton(
            icon: Icon(
              isExpanded ? Icons.arrow_back : Icons.menu,
              size: 5.sp,
              color: Colors.grey,
            ),
            onPressed: onToggle,
          ),
        ],
      ),
    );
  }
}
