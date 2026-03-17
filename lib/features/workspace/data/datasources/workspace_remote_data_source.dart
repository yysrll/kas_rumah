import 'package:kas_rumah/features/workspace/data/dto/workspace_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class WorkspaceRemoteDataSource {
  Future<List<WorkspaceDto>> getWorkspaces();
  Future<WorkspaceDto> saveWorkspace(WorkspaceDto workspace);
  Future<void> deleteWorkspace(String id);
}

class WorkspaceRemoteDataSourceImpl implements WorkspaceRemoteDataSource {
  final SupabaseClient _supabase;

  const WorkspaceRemoteDataSourceImpl(this._supabase);

  @override
  Future<List<WorkspaceDto>> getWorkspaces() async {
    final response = await _supabase
        .from('workspaces')
        .select('''
            id,
            owner_id,
            name,
            currency,
            description,
            profiles!workspaces_owner_id_fkey (
              name
            )
          ''')
        .eq('owner_id', _supabase.auth.currentUser!.id);
    final list = (response as List)
        .map(
          (row) =>
              WorkspaceDto.fromJson(row['workspaces'] as Map<String, dynamic>),
        )
        .toList();
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
