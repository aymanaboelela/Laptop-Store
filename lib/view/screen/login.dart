import 'package:flutter/material.dart';

import '../../core/constant/image.dart';
import '../widget/login_background.dart';
import '../widget/login_center_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(kBackgroundLoginPage),
          const LoginBackground(),

        const  CenterInput(),
        ],
      ),
    );
  }
}
