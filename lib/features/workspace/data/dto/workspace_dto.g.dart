// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkspaceDto _$WorkspaceDtoFromJson(Map<String, dynamic> json) => WorkspaceDto(
  id: json['id'] as String?,
  ownerId: json['ownerId'] as String?,
  owner: json['owner'] == null
      ? null
      : ProfileDto.fromJson(json['owner'] as Map<String, dynamic>),
  name: json['name'] as String?,
  currency: json['currency'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$WorkspaceDtoToJson(WorkspaceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'owner': instance.owner,
      'name': instance.name,
      'currency': instance.currency,
      'description': instance.description,
    };
