

import 'package:cyberCrypto/ui/component/splashScreen.dart';
import 'package:cyberCrypto/ui/screen/login.dart';
import 'package:cyberCrypto/ui/screen/mainPage.dart';

final routes = {
  '/': (context) => SplashScreenMode(),
  '/login': (context) => Login(),
  '/home': (context) => MainPage(),
};
