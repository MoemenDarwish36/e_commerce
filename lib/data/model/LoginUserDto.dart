import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';

class LoginUserDto extends LoginUserEntity {
  LoginUserDto({
    super.name,
    super.email,
    this.role,
  });

  LoginUserDto.fromJson(dynamic json) {
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
