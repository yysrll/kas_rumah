import 'package:fpdart/fpdart.dart';
import 'package:kas_rumah/core/errors/failure.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/domain/params/save_workspace_param.dart';

abstract class WorkspaceRepository {
  Future<Either<Failure, List<WorkspaceModel>>> getWorkspaces();
  Future<Either<Failure, WorkspaceModel>> getWorkspaceById(String id);
  Future<Either<Failure, WorkspaceModel>> saveWorkspace(
    SaveWorkspaceParam param,
  );
  Future<Either<Failure, Unit>> deleteWorkspace(String id);
}