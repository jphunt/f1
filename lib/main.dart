import 'package:f1/core/enums/view_state.dart';
import 'package:f1/core/providers/app_provider.dart';
import 'package:f1/ui/pages/home_screen.dart';
import 'package:f1/ui/pages/landing_screen.dart';
import 'package:f1/ui/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _buildApp(context),
      )
    );
  }

  Widget _buildApp(context) {
    return Consumer<AppProvider>(
      builder: (context, appModel, _) {
        switch (appModel.loginState) {
          case LoginState.LoggedIn:
            return HomeScreen();
          case LoginState.IsLogging:
            return LoginScreen();
          default:
            return LandingScreen();
        }
      },
    );
  }
}
