import 'package:get_it/get_it.dart';
import 'package:socigate_system/src/modules/dashboard/data/dashboard_data_injection.dart';
import 'package:socigate_system/src/modules/dashboard/domain/dashboard_domain_injection.dart';
import 'package:socigate_system/src/modules/dashboard/presentation/dashboard_presentation_injection.dart';

void registerDashboardDependencies(GetIt sl) {
  registerDashboardDataDependencies(sl);
  registerDashboardDomainDependencies(sl);
  registerDashboardPresentationDependencies(sl);
}
