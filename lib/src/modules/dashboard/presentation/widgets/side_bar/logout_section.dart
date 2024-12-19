import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutSection extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback logoutAction;
  const LogoutSection(
      {required this.isExpanded, super.key, required this.logoutAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () => _showLogoutConfirmationDialog(context, logoutAction),
        child: Row(
          mainAxisAlignment:
              isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout,
              color: Colors.grey,
              size: 5.sp,
            ),
            if (isExpanded) ...[
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(
      BuildContext context, VoidCallback logoutAction) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      title: 'Confirm Logout',
      desc: 'Are you sure you want to logout?',
      btnOkText: 'Logout',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Navigator.of(context).pop();
        logoutAction();
      },
    ).show();
  }
}
