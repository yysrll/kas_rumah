import 'package:injectable/injectable.dart';
import 'package:kas_rumah/features/profile/data/dto/profile_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileDto> getProfile();
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient _supabase;

  const ProfileRemoteDataSourceImpl(this._supabase);

  @override
  Future<ProfileDto> getProfile() async {
    final userId = _supabase.auth.currentUser?.id;
      if (userId == null) throw Exception("User tidak terautentikasi");

      final response = await _supabase
          .from('profiles')
          .select()
          .eq('id', userId)
          .single();

      return ProfileDto.fromJson(response);
  }
}
