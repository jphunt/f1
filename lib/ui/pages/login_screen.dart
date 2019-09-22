import 'package:f1/core/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: Provider.of<AppProvider>(context).signIn,
          child: Text("Sign In"),
        ),
      ),
    );
  }
}
