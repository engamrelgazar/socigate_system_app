import 'package:equatable/equatable.dart';
import 'package:socigate_system/src/core/shared/entities/role_entity.dart';

class UserData extends Equatable {
  final String userName;
  final String profilePicPath;
  final String lastLogin;
  final Role roleData;

  const UserData(
      {required this.userName,
      required this.profilePicPath,
      required this.lastLogin,
      required this.roleData});

  @override
  List<Object?> get props => [userName, profilePicPath, lastLogin, roleData];
}
