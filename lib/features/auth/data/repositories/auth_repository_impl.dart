import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/errors/exceptions.dart';
import 'package:kas_rumah/core/errors/failure.dart';
import 'package:kas_rumah/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:kas_rumah/features/auth/data/mapper/user_mapper.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';
import 'package:kas_rumah/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserModel?>> getCurrentUser() async {
    try {
      final dto = await remoteDataSource.getCurrentUser();
      if (dto == null) return const Right(null);
      return Right(UserMapper.toModel(dto));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final dto = await remoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserMapper.toModel(dto));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final dto = await remoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      return Right(UserMapper.toModel(dto));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(unit);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
