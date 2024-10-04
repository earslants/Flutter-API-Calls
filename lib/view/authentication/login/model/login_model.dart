import '../../../../core/base/model/base_model.dart';

class LoginModel extends BaseModel {
  String? email;
  String? password;

  LoginModel({this.email, this.password});

  @override
  fromJson(Map<String, dynamic> json) {
    return LoginModel(
      password: json['password'] as String?,
      email: json['email'] as String?,
    );
  }

  @override
  Map<String, Object?> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
