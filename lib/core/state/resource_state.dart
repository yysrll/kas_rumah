import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_state.freezed.dart';

@freezed
abstract class ResourceState<T> with _$ResourceState<T> {
  const factory ResourceState.initial() = _Initial<T>;
  const factory ResourceState.loading() = _Loading<T>;
  const factory ResourceState.success(T data) = _Success<T>;
  const factory ResourceState.error(String message) = _Error<T>;
}
