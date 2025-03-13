import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
    super.statusMsg,
    super.message,
    super.user,
    super.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    user = json['user'] != null ? LoginUserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class LoginUserDto extends LoginUserEntity {
  String? role;

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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
