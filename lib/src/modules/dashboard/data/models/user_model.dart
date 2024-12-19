import 'package:socigate_system/src/core/shared/models/role_model.dart';
import 'package:socigate_system/src/modules/dashboard/domain/entities/user_entities.dart';

class UserDataModel extends UserData {
  const UserDataModel({
    required super.userName,
    required super.profilePicPath,
    required super.lastLogin,
    required super.roleData,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      userName: json['user_name'],
      lastLogin: json['last_login'],
      profilePicPath: json['employee']['profile_picture_path'],
      roleData: RoleModel.fromJson(json['role']),
    );
  }
}
