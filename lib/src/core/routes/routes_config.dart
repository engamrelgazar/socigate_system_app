import 'package:go_router/go_router.dart';
import 'package:socigate_system/src/modules/auth/presentation/pages/auth_page.dart';
import 'package:socigate_system/src/modules/dashboard/presentation/pages/dashboard.dart';
import 'package:socigate_system/src/modules/splash/presentation/pages/splash_page.dart';
import 'names.dart';

final List<GoRoute> appRoutes = [
  GoRoute(
    path: RoutesName.initial,
    builder: (context, state) => const SplashPage(),
  ),
  GoRoute(
    path: RoutesName.dashboard,
    builder: (context, state) => const DashboardPage(),
  ),
  GoRoute(
    path: RoutesName.login,
    builder: (context, state) => const AuthenticationPage(),
  ),
];
