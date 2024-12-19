import 'package:socigate_system/src/core/shared/models/role_model.dart';
import 'package:socigate_system/src/modules/auth/domain/entities/user_entities.dart';

class AuthUserModel extends AuthUser {
  const AuthUserModel({
    required super.role,
    required super.apiKey,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      apiKey: json['api_key'],
      role:  RoleModel.fromJson(json['role']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'api_key': apiKey,
      'role' : role
    };
  }
}
