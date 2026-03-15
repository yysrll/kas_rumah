import 'package:fpdart/fpdart.dart';
import 'package:kas_rumah/core/errors/failure.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';

abstract class AuthRepository {
  /// Returns the currently signed-in user, or null if not authenticated.
  Future<Either<Failure, UserModel?>> getCurrentUser();

  /// Signs in with email and password. Returns [UserModel] on success.
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Registers a new account. Returns [UserModel] on success.
  Future<Either<Failure, UserModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  });

  /// Signs out the current user.
  Future<Either<Failure, Unit>> signOut();
}
