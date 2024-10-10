import 'package:flutter/material.dart';
import '../../../../core/base/viewmodel/base_view_model.dart';
import '../model/login_model.dart';
import '../service/ILoginService.dart';
import '../service/login_service.dart';

class LoginViewModel extends BaseViewModel with ChangeNotifier {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  ILoginService? loginService;

  TextEditingController? emailController;
  TextEditingController? passwordController;
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool _isVisible = false;
  bool get isVisible => _isVisible;

  final bool _isAuth = false;
  bool get isAuth => _isAuth;

  @override
  void setContext(BuildContext context) => myContext = context;

  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginService = LoginService(context: myContext);
  }

  void setIsVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void login() async {
    try {
      await loginService!.login(LoginModel(
          email: emailController?.text, password: passwordController?.text));
    } catch (e) {
      // TODO Add Error pop up message
    }
    notifyListeners();
  }

  void logOut() async {}
}
