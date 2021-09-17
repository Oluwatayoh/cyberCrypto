import 'dart:convert';

import 'package:cyberCrypto/ui/models/chunkDataModel.dart';
import 'package:dio/dio.dart';

class CoinService {
  static String mainUrl = "https://pro-api.coinmarketcap.com/v1/";
  final String apiKey = "b8c4fdf2-89eb-43b1-b1e2-cf7800e5b040";
  var currencyListingAPI = '${mainUrl}cryptocurrency/listings/latest';
  Dio _dio = Dio();

  Future<List<BigDataModel>?> getCoins() async {
    // try {
    _dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
    Response response = await _dio.get(currencyListingAPI);
    if (response.statusCode == 200) {
      var body = response.data;
      print(body);
      var data = body['data'];
      try {
        if (data.length > 0) {
          List<BigDataModel> _cn = [];
          for (var c in data) {
            BigDataModel l = BigDataModel.fromJson(c);
            _cn.add(l);
          }
          return _cn;
        }
      } catch (e) {}
    }
  }
}
