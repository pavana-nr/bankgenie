// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Office _$OfficeFromJson(Map<String, dynamic> json) => Office(
      externalId: json['externalId'] as String?,
      hierarchy: json['hierarchy'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String? ?? "",
      nameDecorated: json['nameDecorated'] as String?,
      openingDate:
          (json['openingDate'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'externalId': instance.externalId,
      'nameDecorated': instance.nameDecorated,
      'hierarchy': instance.hierarchy,
      'openingDate': instance.openingDate,
    };
