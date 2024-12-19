import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:socigate_system/src/core/constants/colors.dart';
import 'package:socigate_system/src/modules/dashboard/presentation/bloc/bloc.dart';
import 'package:socigate_system/src/modules/dashboard/presentation/widgets/side_bar/dashboard_sidebar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              GetIt.instance<DashboardBloc>()..add(LoadUserDataEvent()),
        ),
        BlocProvider(
          create: (_) => GetIt.instance<SideMenuBloc>(),
        ),
      ],
      child: Scaffold(
        body: Row(
          children: [
            const DashboardSidebar(),
            Expanded(
              child: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  if (state is DashboardLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DashboardErrorState) {
                    return Center(child: Text(state.message));
                  } else if (state is UserDataLoadedState) {
                    final userData = state.userData;
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(userData.profilePicPath),
                                ),
                                SizedBox(width: 2.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userData.userName,
                                      style: const TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(0, 0, 0, 0.9),
                                      ),
                                    ),
                                    Text(
                                      userData.lastLogin,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(0, 0, 0, 0.6),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Badge.count(
                                  count: 0,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications,
                                      size: 35,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Badge.count(
                                  count: 0,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.email,
                                      size: 35,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IndexedStack(
                          index: context.watch<SideMenuBloc>().selectedIndex,
                          children: const [
                            Center(child: Text("Page 1")),
                            Center(child: Text("Page 2")),
                          ],
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
