import 'package:socigate_system/src/modules/dashboard/domain/repositories/base_dashboard_repositories.dart';

class GetUserData {
  final BaseDashboardRepositories repository;

  GetUserData(this.repository);

  execute() async {
    return await repository.getUserData();
  }
}
