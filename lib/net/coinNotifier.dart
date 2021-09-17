import 'package:cyberCrypto/services/coinService.dart';
import 'package:cyberCrypto/ui/models/chunkDataModel.dart';
import 'package:flutter/cupertino.dart';

class CoinNotifier extends ChangeNotifier {
  CoinService coinService = CoinService();

  // late Future<BigDataModel> _coinData;
  List<BigDataModel>? _coinData = [];

  List<BigDataModel> get coinLists => _coinData!;

  getCoinsLists() async {
    try {
      await coinService.getCoins().then((value) {
        _coinData = value;
      });
      notifyListeners();
    } catch (e) {}
  }
}
