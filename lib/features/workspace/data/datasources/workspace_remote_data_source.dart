import 'package:injectable/injectable.dart';
import 'package:kas_rumah/features/workspace/data/dto/workspace_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class WorkspaceRemoteDataSource {
  Future<List<WorkspaceDto>> getWorkspaces();
  Future<WorkspaceDto> saveWorkspace(
    String? uid,
    String name,
    String? description,
  );
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

    final list = (response as List)
        .map((json) => WorkspaceDto.fromJson(json as Map<String, dynamic>))
        .toList();
    return list;
  }

  @override
  Future<WorkspaceDto> saveWorkspace(
    String? uid,
    String name,
    String? description,
  ) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) throw Exception("User not authenticated");
    final Map<String, dynamic> data = {
      'name': name,
      'description': description,
    };
    if (uid == null || uid.isEmpty) {
      data['owner_id'] = userId;
    } else {
      data['id'] = uid;
    }

    final response = await _supabase
        .from('workspaces')
        .upsert(data)
        .select('id, name, description, owner_id')
        .single();

    return WorkspaceDto.fromJson(response);
  }

  @override
  Future<void> deleteWorkspace(String id) {
    // TODO: implement deleteWorkspace
    throw UnimplementedError();
  }
}
