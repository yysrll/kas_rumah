import 'package:equatable/equatable.dart';
 
class UserModel extends Equatable {
  final String id;
  final String email;
  final String? name;
  final DateTime? createdAt;
 
  const UserModel({
    required this.id,
    required this.email,
    this.name,
    this.createdAt,
  });
 
  @override
  List<Object?> get props => [id, email, name, createdAt];
}
 