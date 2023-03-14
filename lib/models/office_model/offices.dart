import 'package:json_annotation/json_annotation.dart';

part 'offices.g.dart';

@JsonSerializable()
class Offices {
  final int? id;
  final String? name, nameDecorated, externalId, hierarchy;
  final List openingDate;

  Offices(
      {required this.externalId,
      required this.hierarchy,
      required this.id,
      required this.name,
      required this.nameDecorated,
      required this.openingDate});

  factory Offices.fromJson(Map<String, dynamic> json) =>
      _$OfficesFromJson(json);

  Map<String, dynamic> toJson() => _$OfficesToJson(this);
}
