import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:kas_rumah/features/workspace/data/dto/workspace_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class WorkspaceRemoteDataSource {
  Future<List<WorkspaceDto>> getWorkspaces();
  Future<WorkspaceDto> saveWorkspace(WorkspaceDto workspace);
  Future<void> deleteWorkspace(String id);
}

@LazySingleton(as: WorkspaceRemoteDataSource)
class WorkspaceRemoteDataSourceImpl implements WorkspaceRemoteDataSource {
  final SupabaseClient _supabase;

  const WorkspaceRemoteDataSourceImpl(this._supabase);

  @override
  Future<List<WorkspaceDto>> getWorkspaces() async {
    final response = await _supabase.from('workspaces').select('''
      id,
      name,
      currency,
      description,
      owner_id
    ''');

    log('Fetched workspaces userId: ${_supabase.auth.currentUser!.id}');
    log('Fetched workspaces response: $response');
    final list = (response as List)
        .map((json) => WorkspaceDto.fromJson(json as Map<String, dynamic>))
        .toList();
    log('Fetched workspaces: $list');
    return list;
  }

  @override
  Future<WorkspaceDto> saveWorkspace(WorkspaceDto workspace) {
    // TODO: implement saveWorkspace
    throw UnimplementedError();
  }

  @override
  Future<void> deleteWorkspace(String id) {
    // TODO: implement deleteWorkspace
    throw UnimplementedError();
  }
}
