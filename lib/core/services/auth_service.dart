import 'package:f1/core/agent.dart';

class AuthService {
  Agent _agent;

  AuthService.name(this._agent);

  Future signIn(String username, String password) {
    return _agent.postRequest(
      "/login",
      {
        "username": username,
        "password": password,
      },
    );
  }
}
