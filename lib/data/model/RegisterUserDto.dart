import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

class RegisterUserDto extends RegisterUserEntity {
  RegisterUserDto({
    super.name,
    super.email,
    this.role,
  });

  RegisterUserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
