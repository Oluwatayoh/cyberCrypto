import 'package:cyberCrypto/ui/screen/mainPage.dart';
import 'package:cyberCrypto/ui/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreenMode extends StatelessWidget {
  const SplashScreenMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
          body: SplashScreenView(
              navigateRoute: MainPage(),
              duration: 5000,
              speed: 1,
              imageSize: 350,
              imageSrc: "assets/images/logo.png",
              textType: TextType.NormalText,
              text: "Cyber Crypto",
              textStyle: TextStyle(fontSize: 18.0, fontFamily: "Nunito-Bold"),
              backgroundColor:
                  themeNotifier.isDark ? Colors.black : Colors.white12));
    });
  }
}
