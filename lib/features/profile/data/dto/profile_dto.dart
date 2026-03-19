import 'package:json_annotation/json_annotation.dart';
import 'package:kas_rumah/features/profile/domain/models/profile_model.dart';

part 'profile_dto.g.dart';

@JsonSerializable()
class ProfileDto {
  final String? id;
  final String? name;

  ProfileDto({this.id, this.name});

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);

  ProfileModel toModel() {
    return ProfileModel(id: id ?? '', name: name ?? '');
  }
}
