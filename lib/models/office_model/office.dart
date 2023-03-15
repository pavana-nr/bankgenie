import 'package:json_annotation/json_annotation.dart';

part 'office.g.dart';

@JsonSerializable()
class Office {
  final int? id;
  final String? name, externalId, nameDecorated, hierarchy;
  final List<int> openingDate;

  Office(
      {required this.externalId,
      required this.hierarchy,
      required this.id,
      this.name = "",
      required this.nameDecorated,
      required this.openingDate});

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}
