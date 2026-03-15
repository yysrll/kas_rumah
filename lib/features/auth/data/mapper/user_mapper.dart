import 'package:kas_rumah/features/auth/data/dto/user_dto.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserMapper {
  /// Maps Supabase [User] → [UserDto]
  static UserDto fromSupabaseUser(User user) {
    return UserDto(
      id: user.id,
      email: user.email ?? '',
      name: user.userMetadata?['name'] as String?,
      createdAt: user.createdAt,
    );
  }
 
  /// Maps [UserDto] → domain [UserModel]
  static UserModel toModel(UserDto dto) {
    return UserModel(
      id: dto.id,
      email: dto.email,
      name: dto.name,
      createdAt: dto.createdAt != null
          ? DateTime.tryParse(dto.createdAt!)
          : null,
    );
  }
 
  /// Convenience: Supabase [User] → domain [UserModel]
  static UserModel fromSupabaseUserToModel(User user) {
    return toModel(fromSupabaseUser(user));
  }
}
 