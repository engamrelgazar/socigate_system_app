import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:socigate_system/src/core/error/failure.dart';
import 'package:socigate_system/src/core/error/handle_failure.dart';
import 'package:socigate_system/src/modules/dashboard/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:socigate_system/src/modules/dashboard/presentation/widgets/side_bar/logout_section.dart';
import 'package:socigate_system/src/modules/dashboard/presentation/widgets/side_bar/side_bar_header.dart';
import 'package:socigate_system/src/modules/dashboard/presentation/widgets/side_bar/sidebar_menu_item.dart';

class _SidebarMenuItemData {
  final IconData icon;
  final String title;

  const _SidebarMenuItemData({required this.icon, required this.title});
}

const List<_SidebarMenuItemData> _menuItems = [
  _SidebarMenuItemData(icon: Icons.dashboard, title: 'Dashboard'),
  _SidebarMenuItemData(icon: Icons.task_alt, title: 'Task management'),
  _SidebarMenuItemData(icon: Icons.folder, title: 'Project management'),
  _SidebarMenuItemData(icon: Icons.campaign, title: 'Campaign'),
  _SidebarMenuItemData(icon: Icons.attach_money, title: 'Budget'),
  _SidebarMenuItemData(icon: Icons.account_balance_wallet, title: 'Finance'),
  _SidebarMenuItemData(icon: Icons.bar_chart, title: 'Sales'),
  _SidebarMenuItemData(icon: Icons.people, title: 'CRM'),
  _SidebarMenuItemData(icon: Icons.person, title: 'HR'),
  _SidebarMenuItemData(icon: Icons.pie_chart, title: 'Report'),
  _SidebarMenuItemData(icon: Icons.file_copy, title: 'Document management'),
];

class DashboardSidebar extends StatelessWidget {
  const DashboardSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final sideMenuBloc = context.read<SideMenuBloc>();
    return BlocBuilder<SideMenuBloc, SideMenuState>(
      builder: (context, state) {
        final isExpanded = sideMenuBloc.isExpanded;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isExpanded ? 90.w : 25.w,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, isExpanded, sideMenuBloc),
                Expanded(
                    child: _buildMenuList(context, sideMenuBloc, isExpanded)),
                _buildLogoutSection(isExpanded, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(
      BuildContext context, bool isExpanded, SideMenuBloc sideMenuBloc) {
    return SidebarHeader(
      isExpanded: isExpanded,
      onToggle: () => sideMenuBloc.add(ToggleSidebarEvent()),
    );
  }

  Widget _buildMenuList(
      BuildContext context, SideMenuBloc sideMenuBloc, bool isExpanded) {
    return ListView(
      children: [
        for (int i = 0; i < _menuItems.length; i++)
          SidebarMenuItem(
            icon: _menuItems[i].icon,
            title: _menuItems[i].title,
            isSelected: sideMenuBloc.selectedIndex == i,
            isExpanded: isExpanded,
            onTap: () => sideMenuBloc.add(MenuSelectEvent(i)),
          ),
      ],
    );
  }

  Widget _buildLogoutSection(bool isExpanded, BuildContext context) {
    return BlocConsumer<SideMenuBloc, SideMenuState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          context.go('/login');
        } else if (state is LogoutError) {
          handleFailure(context, GeneralFailure(message: state.error));
        }
      },
      builder: (context, state) {
        return LogoutSection(
          isExpanded: isExpanded,
          logoutAction: () =>
              {context.read<SideMenuBloc>()..add(LogoutRequested())},
        );
      },
    );
  }
}
