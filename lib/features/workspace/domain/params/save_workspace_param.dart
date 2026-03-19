import 'package:json_annotation/json_annotation.dart';

part 'save_workspace_param.g.dart';

@JsonSerializable()
class SaveWorkspaceParam {
  final String? id;
  final String name;
  final String? description;

  SaveWorkspaceParam({
    this.id,
    required this.name,
    this.description,
  });

  factory SaveWorkspaceParam.fromJson(Map<String, dynamic> json) =>
      _$SaveWorkspaceParamFromJson(json);

  Map<String, dynamic> toJson() => _$SaveWorkspaceParamToJson(this);
}