import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/errors/failure.dart';
import 'package:kas_rumah/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:kas_rumah/features/profile/domain/models/profile_model.dart';
import 'package:kas_rumah/features/profile/domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remote;

  const ProfileRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final dtos = await _remote.getProfile();
      return Right(dtos.toModel());
    } catch (e) {
      log('Error fetching profile: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}
