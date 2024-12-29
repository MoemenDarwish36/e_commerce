import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

import 'RegisterUserDto.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
    super.message,
    super.user,
    super.statusMsg,
    super.token,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? RegisterUserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

}
