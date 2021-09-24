
class LoginReqDto {
  final String? username;
  final String? password;

  LoginReqDto(this.username, this.password);

  Map<String, dynamic> toJson() => {
      "usernmae":username,
      "password":password,

      };
}