import 'package:cyberCrypto/services/navigationService.dart';
import 'package:cyberCrypto/ui/component/appBar.dart';
import 'package:cyberCrypto/ui/screen/home.dart';
import 'package:cyberCrypto/ui/screen/login.dart';
import 'package:cyberCrypto/ui/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TabItem { home, logOut }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // TabItem _currentItem = TabItem.home;
  // final List<TabItem> _bottomTabs = [
  //   TabItem.home,
  //   TabItem.logOut,
  // ];

  NavigationService _navService = NavigationService();

logout(){
  _navService.navigateToReplacement("/login");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
              left: Icon(
                Icons.notes,
              ),
              title: 'Wallets',
              right: GestureDetector(
               onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
                child: Icon(
                  Icons.logout
                ),
              )),
        ),
      ),
      body: HomeScreen(),
    );
  }
}
