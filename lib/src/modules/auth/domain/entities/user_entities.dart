import 'package:equatable/equatable.dart';
import 'package:socigate_system/src/core/shared/entities/role_entity.dart';


class AuthUser extends Equatable {
  final String apiKey;
  final Role role;

  const AuthUser({
    required this.apiKey,
    required this.role
  });
  @override
  List<Object?> get props => [apiKey,role];
}
