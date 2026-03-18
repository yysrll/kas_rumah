import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kas_rumah/features/profile/domain/profile_model.dart';

part 'workspace_model.freezed.dart';

@freezed
abstract class WorkspaceModel with _$WorkspaceModel {
  factory WorkspaceModel({
    required String id,
    required String ownerId,
    required ProfileModel owner,
    required String name,
    required String currency,
    String? description,
  }) = _WorkspaceModel;
}
