import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/state/resource_state.dart';
import 'package:kas_rumah/core/storage/kas_storage.dart';
import 'package:kas_rumah/core/storage/kas_storage_keys.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/domain/repositories/workspace_repository.dart';

@injectable
class WorkspaceSelectionCubit extends Cubit<ResourceState<WorkspaceModel>> {
  final WorkspaceRepository _repository;
  final KasStorage _storage;

  WorkspaceSelectionCubit(this._repository, this._storage) : super(const ResourceState.initial());

  Future<void> loadSelectedWorkspace() async {
    emit(const ResourceState.loading());
    try {
      final workspaceId = _storage.getString(KasStorageKeys.workspaceUidKey);
      if (workspaceId == null || workspaceId.isEmpty) {
        emit(const ResourceState.error("No workspace selected"));
        return;
      }
      final result = await _repository.getWorkspaceById(workspaceId);
      result.fold(
        (failure) => emit(ResourceState.error(failure.message)),
        (workspace) => emit(ResourceState.success(workspace)),
      );
    } catch (e) {
      emit(ResourceState.error("Failed to load selected workspace: $e"));
    }
  }

  Future<void> selectWorkspace(WorkspaceModel workspace) async {
    emit(const ResourceState.loading());
    try {
      _storage.setString(KasStorageKeys.workspaceUidKey, workspace.id);
      emit(ResourceState.success(workspace));
    } catch (e) {
      emit(ResourceState.error("Failed to select workspace $e"));
    }
  }

  Future<void> clearSelectedWorkspace() async {
    emit(const ResourceState.loading());
    try {
      _storage.remove(KasStorageKeys.workspaceUidKey);
      emit(const ResourceState.initial());
    } catch (e) {
      emit(ResourceState.error("Failed to clear selected workspace: $e"));
    }
  }
}
