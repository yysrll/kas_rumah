import 'package:fpdart/fpdart.dart';
import 'package:kas_rumah/core/errors/failure.dart';
import 'package:kas_rumah/features/profile/domain/models/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getProfile();
}