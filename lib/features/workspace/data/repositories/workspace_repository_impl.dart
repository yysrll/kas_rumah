import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/errors/failure.dart';
import 'package:kas_rumah/features/workspace/data/datasources/workspace_remote_data_source.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/domain/params/save_workspace_param.dart';
import 'package:kas_rumah/features/workspace/domain/repositories/workspace_repository.dart';

@LazySingleton(as: WorkspaceRepository)
class WorkspaceRepositoryImpl implements WorkspaceRepository {
  final WorkspaceRemoteDataSource _remote;

  const WorkspaceRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<WorkspaceModel>>> getWorkspaces() async {
    try {
      final dtos = await _remote.getWorkspaces();
      final models = dtos.map((dto) => dto.toModel()).toList();
      return Right(models);
    } catch (e) {
      log('Error fetching workspaces: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WorkspaceModel>> saveWorkspace(
    SaveWorkspaceParam param,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteWorkspace(String id) async {
    throw UnimplementedError();
  }
}
