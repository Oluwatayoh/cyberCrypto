import 'dart:async';
import 'dart:convert';

import 'package:cyberCrypto/net/coinNotifier.dart';
import 'package:cyberCrypto/services/authService.dart';
import 'package:cyberCrypto/ui/component/cardWallet.dart';
import 'package:cyberCrypto/ui/component/constants.dart';
import 'package:cyberCrypto/ui/component/cryptoItem.dart';
import 'package:cyberCrypto/ui/models/chunkDataModel.dart';
import 'package:cyberCrypto/ui/models/user.dart';
import 'package:cyberCrypto/ui/themes/theme_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cyberCrypto/ui/screen/detail_wallet.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateFormat dateFormat = DateFormat("HH:mm:ss");
  Timer? timer;

  bool _running = true;

  Stream<List<BigDataModel>> _getCoins() async* {
    CoinNotifier cn = Provider.of<CoinNotifier>(context, listen: false);
    cn.getCoinsLists();
    yield cn.coinLists;
    while (_running) {
      await Future<void>.delayed(Duration(seconds: 50));
      cn.getCoinsLists();
      yield cn.coinLists;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getusers().then((value) {
      var users = UserData.fromJson(jsonDecode(value));
      print(users);
    });
  }

  @override
  Widget build(BuildContext context) {
    // CoinNotifier cn = Provider.of<CoinNotifier>(context);
    // _coinList = cn.coinLists;
    // print(_coinList.length);
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      print(themeNotifier.isDark);
      return Column(
        children: [
          SizedBox(
            height: 25,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailWalletScreen()),
                  );
                },
                child: cardWalletBalance(context,
                    total: '\$39.589',
                    totalCrypto: '7.251332 BTC',
                    color: themeNotifier.isDark
                        ? HexColor(dModeLightDark)
                        : HexColor(dModeGrey2),
                    precent: 7.999),
              ),
              cardWalletBalance(context,
                  total: '\$43.589',
                  color: themeNotifier.isDark
                      ? HexColor(dModeGrey2)
                      : HexColor(dModeLightDark),
                  totalCrypto: '5.251332 ETH',
                  precent: -2.999),
            ]),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text('Current Rate',
                  style: TextStyle(fontFamily: "Nunito-Medium")
                  // style: TextStyle(color: Colors.black45)
                  ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: StreamBuilder<List<BigDataModel>>(
                    stream: _getCoins(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      coinList = snapshot.data!;
                      return Column(
                          children: coinList
                              .map((e) => listCryptoItem(
                                    iconUrl: e.slug,
                                    color: themeNotifier.isDark
                                        ? HexColor(dModeGrey2)
                                        : HexColor(dModeLightDark),
                                    myCrypto: e.name.toString(),
                                    price:
                                        '\$${e.quote!.uSD!.price!.toStringAsFixed(2)}',
                                    lastUpdated: dateFormat
                                        .format(DateTime.parse(
                                            e.quote!.uSD!.lastUpdated!))
                                        .toString(),
                                    percent: e.quote!.uSD!.percentChange1h
                                        .toString(),
                                  ))
                              .toList());
                    }),
              ),
            ),
          )
        ],
      );
    });
  }
}
