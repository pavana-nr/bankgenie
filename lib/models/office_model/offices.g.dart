// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offices _$OfficesFromJson(Map<String, dynamic> json) => Offices(
      externalId: json['externalId'] as String?,
      hierarchy: json['hierarchy'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      nameDecorated: json['nameDecorated'] as String?,
      openingDate: json['openingDate'] as List<dynamic>,
    );

Map<String, dynamic> _$OfficesToJson(Offices instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameDecorated': instance.nameDecorated,
      'externalId': instance.externalId,
      'hierarchy': instance.hierarchy,
      'openingDate': instance.openingDate,
    };
