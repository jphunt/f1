import 'package:f1/core/enums/view_state.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  ViewState _state;
  LoginState _loginState;
  String _token;

  AppProvider() {
    _loginState = LoginState.NotLogin;
    _token = "";
    _init();
  }

  void signIn() async {
    _loginState = LoginState.LoggedIn;
    _token = "token";
//    var sharedPreferences = await SharedPreferences.getInstance();
//    sharedPreferences.setString("token", _token);
    notifyListeners();
  }

  void _init() async {
//    var sharedPreferences = await SharedPreferences.getInstance();
//    _token = sharedPreferences.get("token") ?? "";
//    print("token");
//    print(_token);
    Future.delayed(
      Duration(seconds: 2),
      () {
        _loginState = _token != "" ? LoginState.LoggedIn : LoginState.IsLogging;
        notifyListeners();
      },
    );
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  LoginState get loginState => _loginState;

  set loginState(LoginState value) {
    _loginState = value;
  }

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
  }
}
