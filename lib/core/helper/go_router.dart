
import 'package:flutter/material.dart';
import '../../view/screen/help.dart';
import '../../view/screen/home_page.dart';
import '../../view/screen/login.dart';
import '../../view/screen/otp.dart';
import '../../view/screen/splash.dart';
import '../constant/route.dart';

class GoRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kInti:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case kLogin:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case kOtp:
        return MaterialPageRoute(builder: (context) => const OtpPage());
      case kHelp:
        return MaterialPageRoute(builder: (context) =>   const HelpPage());
      case kHome:
        return MaterialPageRoute(builder: (context) => const HomePage());
      // case kProduct:
      //   return MaterialPageRoute(builder: (context) => const ProdectPage());
      default:
        return null;
    }
  }
}
