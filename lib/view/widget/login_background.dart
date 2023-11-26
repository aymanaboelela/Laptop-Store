import 'package:flutter/material.dart';
import '../../core/constant/color.dart';
import '../../core/constant/image.dart';
import '../../core/helper/responsive.dart';
import 'custom_icon_button.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: SizeConfig.defaultSize! *30,
      child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: kWhite),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                Expanded(
                    child: Divider(
                  color: kBlue,
                  thickness: 2,
                  indent: 30,
                  endIndent: 6,
                )),
                SizeHorizontal(
                  value: 1,
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 15,
                    color: kBlue,
                  ),
                ),
                SizeHorizontal(
                  value: 1,
                ),
                Expanded(
                    child: Divider(
                  color: kBlue,
                  thickness: 2,
                  indent: 10,
                  endIndent: 35,
                )),
              ],
            ),
            const SizeVertical(value: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                CustomIconButton(onTap: () {}, image: kFacebookLogo),
                const Spacer(),
                CustomIconButton(onTap: () {}, image: kAppleLogo),
                const Spacer(),
                CustomIconButton(onTap: () {}, image: kGoogleLogo),
                const Spacer(flex: 2),
              ],
            ),
            const SizeVertical(value: 10)
          ],
        ),
      ),
    );
  }
}
