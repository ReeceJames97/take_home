import 'package:get/get.dart';
import 'package:take_home_pj/bindings/btm_nav_bar_binding.dart';
import 'package:take_home_pj/bindings/home_binding.dart';
import 'package:take_home_pj/bindings/login_binding.dart';
import 'package:take_home_pj/bindings/welcome_binding.dart';
import 'package:take_home_pj/views/dashboard_view.dart';
import 'package:take_home_pj/views/home_view.dart';
import 'package:take_home_pj/views/login_screen_view.dart';
import 'package:take_home_pj/views/splash_screen_view.dart';
import 'package:take_home_pj/views/dashboard_profile_view.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreenView(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => DashboardProfileView(),
      // binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashBoardView(),
      binding: BtmNavBarBinding(),
    ),
  ];
}


abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const WELCOME = _Paths.WELCOME;
  static const DASHBOARD = _Paths.DASHBOARD;
  // static const SPLASH = _Paths.SPLASH;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const WELCOME = '/welcome';
  static const DASHBOARD = '/dashboard';
  // static const SPLASH = '/splash';
}