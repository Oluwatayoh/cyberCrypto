import 'package:cyberCrypto/ui/component/appBar.dart';
import 'package:cyberCrypto/ui/screen/home.dart';
import 'package:cyberCrypto/ui/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TabItem { home, explore, notification, setting }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TabItem _currentItem = TabItem.home;
  final List<TabItem> _bottomTabs = [
    TabItem.home,
    TabItem.explore,
    TabItem.notification,
    TabItem.setting
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
              left: Icon(
                Icons.notes,
                // color: Colors.black54
              ),
              title: 'Wallets',
              right: Icon(
                Icons.account_balance_wallet,
                // color: Colors.black54
              )),
        ),
      ),
      body: _buildScreen(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: _bottomTabs
            .map((tabItem) => _bottomNavigationBarItem(_icon(tabItem), tabItem))
            .toList(),
        onTap: _onSelectTab,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 2,
        backgroundColor:
            themeNotifier.isDark ? Colors.grey.shade500 : Colors.transparent,
      );
    });
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, TabItem tabItem) {
    final Color color =
        _currentItem == tabItem ? Colors.black : Colors.grey.shade400;
    final Color cColor =
        _currentItem == tabItem ? Colors.white : Colors.transparent;
    return BottomNavigationBarItem(
        icon: Container(
            width: 40,
            height: 40,
            decoration: new BoxDecoration(
              color: cColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color)),
        label: '');
  }

  void _onSelectTab(int index) {
    TabItem selectedTabItem = _bottomTabs[index];

    setState(() {
      _currentItem = selectedTabItem;
    });
  }

  IconData _icon(TabItem item) {
    switch (item) {
      case TabItem.home:
        return Icons.account_balance_wallet;
      case TabItem.explore:
        return Icons.explore;
      case TabItem.notification:
        return Icons.notifications;
      case TabItem.setting:
        return Icons.settings;
      default:
        throw 'Unknown $item';
    }
  }

  Widget _buildScreen() {
    switch (_currentItem) {
      case TabItem.home:
        return HomeScreen();
      case TabItem.explore:
      // return HomeScreen();
      case TabItem.notification:
      // return HomeScreen()
      case TabItem.setting:
      // return HomeScreen()
      default:
        return HomeScreen();
    }
  }
}
