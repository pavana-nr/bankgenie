import 'package:json_annotation/json_annotation.dart';

import 'roles_model.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final int? userId, officeId;
  final String? username, base64EncodedAuthenticationKey, officeName;
  bool authenticated, shouldRenewPassword, isTwoFactorAuthenticationRequired;
  List<RolesModel> roles;
  List permissions;

  LoginModel(
      {required this.username,
      required this.userId,
      required this.base64EncodedAuthenticationKey,
      required this.officeId,
      required this.officeName,
      required this.authenticated,
      required this.shouldRenewPassword,
      required this.isTwoFactorAuthenticationRequired,
      required this.roles,
      required this.permissions});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
