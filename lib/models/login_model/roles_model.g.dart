// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolesModel _$RolesModelFromJson(Map<String, dynamic> json) => RolesModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      disabled: json['disabled'] as bool,
    );

Map<String, dynamic> _$RolesModelToJson(RolesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'disabled': instance.disabled,
    };
