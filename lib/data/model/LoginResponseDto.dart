import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';

import 'LoginUserDto.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
    super.message,
    super.user,
    super.statusMsg,
    super.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? LoginUserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}
