import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/state/resource_state.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/domain/repositories/workspace_repository.dart';

@injectable
class WorkspaceCubit extends Cubit<ResourceState<List<WorkspaceModel>>> {
  final WorkspaceRepository _repository;

  WorkspaceCubit(this._repository) : super(const ResourceState.initial());

  Future<void> getWorkspaces() async {
    emit(const ResourceState.loading());
    final result = await _repository.getWorkspaces();
    result.fold(
      (failure) => emit(ResourceState.error(failure.message)),
      (workspaces) => emit(ResourceState.success(workspaces)),
    );
  }
}
