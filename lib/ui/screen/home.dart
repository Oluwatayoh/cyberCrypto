import 'package:cyberCrypto/net/coinNotifier.dart';
import 'package:cyberCrypto/ui/component/cardWallet.dart';
import 'package:cyberCrypto/ui/component/cryptoItem.dart';
import 'package:cyberCrypto/ui/models/chunkDataModel.dart';
import 'package:flutter/material.dart';
import 'package:cyberCrypto/ui/component.dart';
import 'package:cyberCrypto/ui/screen/detail_wallet.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BigDataModel> _coinList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CoinNotifier cn = Provider.of<CoinNotifier>(context, listen: false);
    cn.getCoinsLists();
  }

  @override
  Widget build(BuildContext context) {
    CoinNotifier cn = Provider.of<CoinNotifier>(context);
    _coinList = cn.coinLists;
    print(_coinList.length);
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
                  MaterialPageRoute(builder: (context) => DetailWalletScreen()),
                );
              },
              child: cardWalletBalance(context,
                  total: '\$39.589',
                  totalCrypto: '7.251332 BTC',
                  precent: 7.999),
            ),
            cardWalletBalance(context,
                total: '\$43.589',
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
              child: Column(
                children: [
                  listCryptoItem(
                    iconUrl:
                        'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Bitcoin-icon.png',
                    myCrypto: '3.529020 BTC',
                    myBalance: '\$ 5.441',
                    myProfit: '\$19.153',
                    precent: 4.32,
                  ),
                  listCryptoItem(
                    iconUrl:
                        'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Ethereum-icon.png',
                    myCrypto: '12.83789 ETH',
                    myBalance: '\$ 401',
                    myProfit: '\$4.822',
                    precent: 3.97,
                  ),
                  listCryptoItem(
                    iconUrl:
                        'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Ripple-icon.png',
                    myCrypto: '1911.6374736 XRP',
                    myBalance: '\$ 0.45',
                    myProfit: '\$859',
                    precent: -13.55,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
