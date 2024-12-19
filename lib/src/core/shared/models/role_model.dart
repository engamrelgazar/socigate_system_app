import 'package:socigate_system/src/core/shared/entities/role_entity.dart';

class RoleModel extends Role {
  const RoleModel({
    required super.id,
    required super.name,
    required super.roleDesc,
    required super.permissions,
    required super.createdAt,
    required super.updatedAt,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'],
      name: json['name'],
      roleDesc: json['role_desc'],
      permissions: json['permissions'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role_desc': roleDesc,
      'permissions': permissions,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
