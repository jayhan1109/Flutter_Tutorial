import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '55AC9531-5950-4000-9899-29C4ACA0CBCD';

class CoinData {
  var response;
  var jsonResponse;
  var data;
  Map<String, int> lists = {"BTC": -1, "ETH": -1, "LTC": -1};
  String coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/';
  Future<dynamic> getCoinData(String currency) async {
    for (var list in cryptoList) {
      response = await http.get('$coinAPIURL$list/$currency',
          headers: {'X-CoinAPI-Key': apiKey});
      jsonResponse = jsonDecode(response.body);

      data = jsonResponse['rate'];
      lists[list] = data.round();
    }

    return lists;
  }
}
