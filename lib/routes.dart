import 'package:brag/pages/home_page.dart';
import 'package:brag/pages/initial_page.dart';
import 'package:brag/pages/login_page.dart';
import 'package:brag/pages/preload_page.dart';
import 'package:brag/pages/register_form.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static const String initialPage = '/';
  static const String loginPage = '/login';
  static const String registerForm = '/register';
  static const String homePage = '/home';
  static const String infoPage = '/info';
  static const String successScreen = '/success';
  static const String preloadPage = '/preload';
  static const String searchPage = '/search';
  static const String lazerPage = '/lazer';
  static const String localPage = '/local';
  static const String favoritesPage = '/favorites';
  static const String listAreaPage = '/listarea';

  RouterGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialPage:
        return MaterialPageRoute(
          builder: (_) => const InitialPage(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case registerForm:
        return MaterialPageRoute(
          builder: (_) => RegisterForm(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case preloadPage:
        return MaterialPageRoute(
          builder: (_) => PreloadPage(),
        );
      // case homePage:
      //   return MaterialPageRoute(
      //     builder: (_) => HomePage(),
      //   );
      // case homePage:
      //   return MaterialPageRoute(
      //     builder: (_) => HomePage(),
      //   );
      // case homePage:
      //   return MaterialPageRoute(
      //     builder: (_) => HomePage(),
      //   );
      // case homePage:
      //   return MaterialPageRoute(
      //     builder: (_) => HomePage(),
      //   );
      // // case infoPage:
      //   return MaterialPageRoute(
      //     builder: (_) => const InfoPage(),
      //   );
      // case successScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const SuccessScreen(),
      //   );
      default:
        throw const FormatException(
          "Rota não encontrada",
        );
    }
  }
}
