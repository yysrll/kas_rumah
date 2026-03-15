import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/errors/exceptions.dart' as exceptions;
import 'package:kas_rumah/features/auth/data/dto/user_dto.dart';
import 'package:kas_rumah/features/auth/data/mapper/user_mapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<UserDto?> getCurrentUser();
  Future<UserDto> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserDto> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  });
  Future<void> signOut();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabase;

  const AuthRemoteDataSourceImpl(this._supabase);

  @override
  Future<UserDto?> getCurrentUser() async {
    try {
      final user = _supabase.auth.currentUser;
      log('Current Supabase user: $user');
      if (user == null) return null;
      return UserMapper.fromSupabaseUser(user);
    } on exceptions.AuthException catch (e) {
      throw exceptions.AuthException(e.message);
    } catch (e) {
      throw exceptions.ServerException(e.toString());
    }
  }

  @override
  Future<UserDto> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        throw const exceptions.AuthException(
          'Sign in failed: no user returned.',
        );
      }

      return UserMapper.fromSupabaseUser(user);
    } on AuthApiException catch (e) {
      log('error: $e');
      throw exceptions.AuthException(e.message);
    } catch (e) {
      throw exceptions.ServerException(e.toString());
    }
  }

  @override
  Future<UserDto> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: name != null ? {'name': name} : null,
      );

      final user = response.user;
      if (user == null) {
        throw const exceptions.AuthException(
          'Sign up failed: no user returned.',
        );
      }

      return UserMapper.fromSupabaseUser(user);
    } on AuthApiException catch (e) {
      throw exceptions.AuthException(e.message);
    } catch (e) {
      throw exceptions.ServerException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } on exceptions.AuthException catch (e) {
      throw exceptions.AuthException(e.message);
    } catch (e) {
      throw exceptions.ServerException(e.toString());
    }
  }
}
