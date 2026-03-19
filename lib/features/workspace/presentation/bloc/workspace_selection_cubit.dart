import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/state/resource_state.dart';
import 'package:kas_rumah/core/storage/kas_storage.dart';
import 'package:kas_rumah/core/storage/kas_storage_keys.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';

@injectable
class WorkspaceSelectionCubit extends Cubit<ResourceState<WorkspaceModel>> {
  final KasStorage _storage;

  WorkspaceSelectionCubit(this._storage) : super(const ResourceState.initial());

  Future<void> selectWorkspace(WorkspaceModel workspace) async {
    emit(const ResourceState.loading());
    try {
      _storage.setString(KasStorageKeys.workspaceUidKey, workspace.id);
      emit(ResourceState.success(workspace));
    } catch (e) {
      emit(ResourceState.error("Failed to select workspace $e"));
    }
  }
}
