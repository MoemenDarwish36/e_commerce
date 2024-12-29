class RegisterResponseEntity {
  String? message;
  RegisterUserEntity? user;
  String? token;
  String? statusMsg;

  RegisterResponseEntity({this.message, this.user, this.token, this.statusMsg});
}

class RegisterUserEntity {
  String? name;
  String? email;

  RegisterUserEntity({
    this.name,
    this.email,
  });
}
