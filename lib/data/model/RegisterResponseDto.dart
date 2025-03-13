import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
    super.statusMsg,
    super.message,
    super.user,
    super.token,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? RegisterUserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class RegisterUserDto extends RegisterUserEntity {
  String? role;

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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
