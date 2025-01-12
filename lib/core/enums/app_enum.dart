import 'package:catalyst/config/colors/app_colors.dart';
import 'package:flutter/material.dart';

enum RoleEnum {
  admin,
  owner,
  client,
}

extension RoleExtension on RoleEnum {
  Color getRoleColor(BuildContext context) {
    switch (this) {
      case RoleEnum.admin:
        return Colors.green;
      case RoleEnum.owner:
        return Colors.blue;
      case RoleEnum.client:
        return AppColors.gray;
    }
  }

  String toShortString() {
    return this.toString().split('.').last; // "owner" from "RoleEnum.owner"
  }
}

RoleEnum mapRoleStringToEnum(String? role) {
  if (role == null) return RoleEnum.client; // Default if null
  switch (role.toLowerCase()) {
    case 'admin':
      return RoleEnum.admin;
    case 'owner':
      return RoleEnum.owner;
    case 'client':
      return RoleEnum.client;
    default:
      return RoleEnum.client;
  }
}

