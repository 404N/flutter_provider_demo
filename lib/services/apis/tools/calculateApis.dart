import 'package:dio/dio.dart';
import 'package:flutter_provider_demo/business_logic/models/tool/rate.dart';
import 'dart:convert';

class CalculateApis {
  final _path = 'https://api.exchangeratesapi.io/latest';
  final Map<String, String> _headers = {'Accept': 'application/json'};

  List<Rate> _rateCache;

  Future<List<Rate>> fetchExchangeRates() async {
    if(_rateCache==null){
      Response res = await Dio().get(_path);
      if (res.statusCode == 200) {
        _rateCache = _createRateListFromRawMap(res.data);
      } else {
        print('getting rates wrong');
      }
    }
    return _rateCache;
  }

  List<Rate> _createRateListFromRawMap(Map jsonObject) {
    final Map rates = jsonObject['rates'];
    final String base = jsonObject['base'];
    List<Rate> list = [];

    // include the base currency in the list
    list.add(Rate(baseCurrency: base, quoteCurrency: base, exchangeRate: 1.0));

    // add all of the quote currency conversion rates
    for (var rate in rates.entries) {
      list.add(Rate(
          baseCurrency: base,
          quoteCurrency: rate.key,
          exchangeRate: rate.value as double));
    }

    return list;
  }
}
