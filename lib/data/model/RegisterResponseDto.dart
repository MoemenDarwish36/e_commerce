import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

import 'UserDto.dart';

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
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['message'] = message;
//   if (user != null) {
//     map['user'] = user?.toJson();
//   }
//   map['token'] = token;
//   return map;
// }
}
