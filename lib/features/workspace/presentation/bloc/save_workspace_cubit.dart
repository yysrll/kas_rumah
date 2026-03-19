import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/state/resource_state.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/domain/params/save_workspace_param.dart';
import 'package:kas_rumah/features/workspace/domain/repositories/workspace_repository.dart';

@injectable
class SaveWorkspaceCubit extends Cubit<ResourceState<WorkspaceModel>> {
  final WorkspaceRepository _repository;

  SaveWorkspaceCubit(this._repository) : super(const ResourceState.initial());

  Future<void> saveWorkspace({
    String? id,
    required String name,
    String? description,
  }) async {
    emit(const ResourceState.loading());
    final result = await _repository.saveWorkspace(
      SaveWorkspaceParam(
        id: id,
        name: name,
        description: description,
      ),
    );
    result.fold(
      (failure) => emit(ResourceState.error(failure.message)),
      (workspaces) => emit(ResourceState.success(workspaces)),
    );
  }
}
