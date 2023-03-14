import 'package:json_annotation/json_annotation.dart';
part 'roles_model.g.dart';

@JsonSerializable()
class RolesModel {
  final int? id;
  final String? name, description;
  bool disabled;

  RolesModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.disabled});

  factory RolesModel.fromJson(Map<String, dynamic> json) =>
      _$RolesModelFromJson(json);

  Map<String, dynamic> toJson() => _$RolesModelToJson(this);
}
