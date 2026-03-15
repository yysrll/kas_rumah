import 'package:fpdart/fpdart.dart';
import 'package:kas_rumah/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

class NoParams {
  const NoParams();
}
