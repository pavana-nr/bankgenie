// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      username: json['username'] as String?,
      userId: json['userId'] as int?,
      base64EncodedAuthenticationKey:
          json['base64EncodedAuthenticationKey'] as String?,
      officeId: json['officeId'] as int?,
      officeName: json['officeName'] as String?,
      authenticated: json['authenticated'] as bool,
      shouldRenewPassword: json['shouldRenewPassword'] as bool,
      isTwoFactorAuthenticationRequired:
          json['isTwoFactorAuthenticationRequired'] as bool,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => RolesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions: json['permissions'] as List<dynamic>,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'officeId': instance.officeId,
      'username': instance.username,
      'base64EncodedAuthenticationKey': instance.base64EncodedAuthenticationKey,
      'officeName': instance.officeName,
      'authenticated': instance.authenticated,
      'shouldRenewPassword': instance.shouldRenewPassword,
      'isTwoFactorAuthenticationRequired':
          instance.isTwoFactorAuthenticationRequired,
      'roles': instance.roles,
      'permissions': instance.permissions,
    };
