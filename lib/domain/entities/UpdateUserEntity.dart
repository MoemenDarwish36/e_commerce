class UpdateUserResponseEntity {
  ErrorsEntity? errors;

  String? message;
  UpdateUserEntity? user;

  UpdateUserResponseEntity({
    this.errors,
    this.message,
    this.user,
  });
}

class UpdateUserEntity {
  String? name;
  String? email;

  UpdateUserEntity({
    this.name,
    this.email,
  });
}

class ErrorsEntity {
  ErrorsEntity({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  String? value;
  String? msg;
  String? param;
  String? location;
}
