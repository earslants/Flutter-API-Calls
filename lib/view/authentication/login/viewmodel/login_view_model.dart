import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/app/error_handler.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/base/viewmodel/base_view_model.dart';
import '../model/login_model.dart';
import '../service/ILoginService.dart';
import '../service/login_service.dart';

class LoginViewModel extends BaseViewModel with ChangeNotifier {
  // ignore: unused_field
  User? _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  ILoginService? loginService;

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool _isVisible = false;
  bool get isVisible => _isVisible;

  bool _isAuth = false;
  bool get isAuth => _isAuth;

  bool? _rememberMe = false;
  bool? get rememberMe => _rememberMe;

  @override
  void setContext(BuildContext context) => myContext = context;

  @override
  Future<void> init() async {
    await LocaleManager.prefrencesInit();
    loginService = LoginService(context: myContext);
    final email = LocaleManager.instance.getStringValue(PreferencesKeys.EMAIL);
    final password =
        LocaleManager.instance.getStringValue(PreferencesKeys.PASSWORD);
    if (email.isNotEmpty && password.isNotEmpty) {
      emailController?.text = email;
      passwordController?.text = password;
    }
    listenAuthState();
  }

  void setIsVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void listenAuthState() {
    _auth.authStateChanges().listen((user) {
      _user = user;
      _isAuth = user != null;
      notifyListeners();
    });
  }

  void login() async {
    try {
      if (_rememberMe == true &&
          emailController != null &&
          passwordController != null) {
        LocaleManager.instance
            .setStringValue(PreferencesKeys.EMAIL, emailController!.text);
        LocaleManager.instance
            .setStringValue(PreferencesKeys.PASSWORD, passwordController!.text);
      }
      await loginService!.login(LoginModel(
          email: emailController?.text, password: passwordController?.text));
    } catch (e) {
      errorTextHandler('An error occured!', myContext);
    }
  }

  void logOut() async {
    try {
      await loginService?.logOut();
    } catch (e) {
      errorTextHandler('An error occured!', myContext);
    }
  }

  void setRememberMe(bool? value) {
    _rememberMe = value;
    notifyListeners();
  }
}
