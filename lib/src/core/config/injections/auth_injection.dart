import 'package:get_it/get_it.dart';
import 'package:socigate_system/src/modules/auth/data/auth_data_injection.dart';
import 'package:socigate_system/src/modules/auth/domain/auth_domain_injection.dart';
import 'package:socigate_system/src/modules/auth/presentation/auth_presentation_injection.dart';

void registerAuthDependencies(GetIt sl) {
  registerAuthDataDependencies(sl);
  registerAuthDomainDependencies(sl);
  registerAuthPresentationDependencies(sl);
}
