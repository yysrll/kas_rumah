import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  factory ProfileModel({required String id, required String name}) =
      _ProfileModel;
}
