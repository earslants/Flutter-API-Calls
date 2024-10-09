import 'package:flutter/material.dart';
import 'package:harrypotterapi/core/base/viewmodel/base_view_model.dart';
import 'package:harrypotterapi/view/authentication/login/model/login_model.dart';
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

  bool? _isAuth;
  bool? get isAuth => _isAuth;

  @override
  void setContext(BuildContext context) => myContext = context;

  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginService = LoginService(context: myContext);
    checkAuth();
  }

  void checkAuth() async {
    _isAuth = await loginService!.checkAuth();
    notifyListeners();
  }

  void setAuth() {}

  void login() async {
    try {
      await loginService!.login(LoginModel());
    } catch (e) {
      // TODO Add Error pop up message
    }
    notifyListeners();
  }
}
