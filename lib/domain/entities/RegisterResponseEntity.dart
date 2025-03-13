class RegisterResponseEntity {
  RegisterUserEntity? user;
  String? message;
  String? statusMsg;
  String? token;

  RegisterResponseEntity({this.user, this.token, this.message, this.statusMsg});
}

class RegisterUserEntity {
  String? name;
  String? email;

  RegisterUserEntity({
    this.name,
    this.email,
  });
}
