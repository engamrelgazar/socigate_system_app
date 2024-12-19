import 'package:equatable/equatable.dart';

class Role extends Equatable {
  final int id;
  final String name;
  final String roleDesc;
  final dynamic permissions;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Role(
      {required this.id,
      required this.roleDesc,
      required this.createdAt,
      required this.updatedAt,
      required this.name,
      required this.permissions});

  @override
  List<Object?> get props =>
      [id, name, roleDesc, permissions, createdAt, updatedAt];
}
