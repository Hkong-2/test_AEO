import 'package:boilerplate/presentation/dashboard/dashboard.dart';
import 'package:boilerplate/presentation/home/home.dart';
import 'package:boilerplate/presentation/login/login.dart';
import 'package:boilerplate/presentation/overview/overview.dart';
import 'package:boilerplate/presentation/template_library/template_library_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String dashboard = '/dashboard';
  static const String login = '/login';
  static const String home = '/post';
  static const String overview = '/overview';
  static const String templateLibrary = '/template_library';
  static const String analytic = '/analytic';

  static final routes = <String, WidgetBuilder>{
    dashboard: (BuildContext context) => DashboardScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    overview: (BuildContext context) => OverviewScreen(),
    templateLibrary: (BuildContext context) => TemplateLibraryScreen(),
    //analytic: (BuildContext context) => AnalyticScreen(),
  };
}
