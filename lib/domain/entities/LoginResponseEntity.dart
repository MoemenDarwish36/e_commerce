class LoginResponseEntity {
  String? message;
  LoginUserEntity? user;
  String? token;
  String? statusMsg;

  LoginResponseEntity({this.message, this.user, this.token, this.statusMsg});
}

class LoginUserEntity {
  String? name;
  String? email;

  LoginUserEntity({
    this.name,
    this.email,
  });
}
