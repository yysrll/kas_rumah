import 'package:json_annotation/json_annotation.dart';
import 'package:kas_rumah/features/profile/data/dto/profile_dto.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';

part 'workspace_dto.g.dart';

@JsonSerializable()
class WorkspaceDto {
  final String? id;
  final String? ownerId;
  final ProfileDto? owner;
  final String? name;
  final String? currency;
  final String? description;

  WorkspaceDto({
    this.id,
    this.ownerId,
    this.owner,
    this.name,
    this.currency,
    this.description,
  });

  factory WorkspaceDto.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkspaceDtoToJson(this);

  WorkspaceModel toModel() {
    return WorkspaceModel(
      id: id ?? '',
      ownerId: ownerId ?? '',
      owner: owner?.toModel() ?? ProfileDto().toModel(),
      name: name ?? '',
      currency: currency ?? '',
      description: description,
    );
  }
}
