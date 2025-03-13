import 'package:e_commerce_app/domain/entities/UpdateUserEntity.dart';

class UpdateUserResponseDto extends UpdateUserResponseEntity {
  UpdateUserResponseDto({
    super.errors,
    super.message,
    super.user,
  });

  UpdateUserResponseDto.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? ErrorsDto.fromJson(json['errors']) : null;

    user = json['user'] != null ? UpdateUserDto.fromJson(json['user']) : null;
  }
}

class UpdateUserDto extends UpdateUserEntity {
  UpdateUserDto({
    super.name,
    super.email,
    this.role,
  });

  UpdateUserDto.fromJson(dynamic json) {
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

class ErrorsDto extends ErrorsEntity {
  ErrorsDto({
    super.value,
    super.msg,
    super.param,
    super.location,
  });

  ErrorsDto.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }
}
