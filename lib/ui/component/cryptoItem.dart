import 'package:cyberCrypto/ui/component/card.dart';
import 'package:flutter/material.dart';

Widget listCryptoItem(
    {String? iconUrl,
    String? percent,
    Color? color,
    String? myCrypto,
    lastUpdated, price
    }) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: card(
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          coinImage(iconUrl!),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '$myCrypto',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '$lastUpdated',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$price',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                '$percent%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: percent.toString().contains('-')
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget coinImage(String coinType) {
  String imageUrl;
  switch (coinType) {
    case "bitcoin":
      imageUrl =
          'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Bitcoin-icon.png';
      break;
    case "ethereum":
      imageUrl =
          'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Ethereum-icon.png';
      break;
    case "cardano":
      imageUrl =
          'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/256/Cardano-icon.png';
      break;
    case "binance-coin":
      imageUrl =
          'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/256/Binance-Coin-BNB-icon.png';
      break;
    case "tether":
      imageUrl = 'https://cryptologos.cc/logos/tether-usdt-logo.png?v=013';
      break;
    case "xrp":
      imageUrl =
          'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Ripple-icon.png';
      break;
    case "dogecoin":
      imageUrl = 'https://cryptologos.cc/logos/dogecoin-doge-logo.png?v=013';
      break;
    case "usd-coin":
      imageUrl =
          'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/256/Dollar-USD-icon.png';
      break;
    case "terra-luna":
      imageUrl = 'https://cryptologos.cc/logos/terra-luna-luna-logo.png';
      break;
    case "avalanche":
      imageUrl = 'https://cryptologos.cc/logos/avalanche-avax-logo.png?v=013';
      break;
    case "solana":
      imageUrl = 'https://cryptologos.cc/logos/solana-sol-logo.png?v=013';
      break;
    default:
      imageUrl =
          'https://www.iconpacks.net/icons/2/free-cryptocurrency-coin-icon-2422-thumb.png';
  }
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        new BoxShadow(
            color: Color(0x2024303E),
            blurRadius: 25.0,
            spreadRadius: 1.5,
            offset: Offset(0.0, 5.0)),
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    child: CircleAvatar(
      radius: 17,
      backgroundColor: Colors.transparent,
      child: Image.network(imageUrl),
    ),
  );
}
