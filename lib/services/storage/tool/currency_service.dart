
import 'package:flutter_provider_demo/business_logic/models/tool/currency.dart';
import 'package:flutter_provider_demo/business_logic/models/tool/rate.dart';

abstract class CurrencyService {
  Future<List<Rate>> getAllExchangeRates({String base});

  Future<List<Currency>> getFavoriteCurrencies();

  Future<void> saveFavoriteCurrencies(List<Currency> data);
}

