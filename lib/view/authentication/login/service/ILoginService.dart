import '../model/login_model.dart';

abstract class ILoginService {
  Future<void> login(LoginModel model);
  Future<void> logOut();
}
