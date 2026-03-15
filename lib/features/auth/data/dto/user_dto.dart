class UserDto {
  final String id;
  final String email;
  final String? name;
  final String? createdAt;
 
  const UserDto({
    required this.id,
    required this.email,
    this.name,
    this.createdAt,
  });
 
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }
 
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    };
  }
}
 