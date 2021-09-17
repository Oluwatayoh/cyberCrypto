import 'package:cyberCrypto/net/coinNotifier.dart';
import 'package:cyberCrypto/net/routes.dart';
import 'package:cyberCrypto/services/navigationService.dart';
import 'package:cyberCrypto/ui/themes/app_theme.dart';
import 'package:cyberCrypto/ui/themes/theme_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoinNotifier()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
          navigatorKey: NavigationService.instance.navigationKey,
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          theme: AppTheme.light,
          routes: routes,
        );
      })));
}
