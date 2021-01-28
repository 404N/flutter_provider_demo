import 'package:flutter_provider_demo/business_logic/models/tool/currency.dart';
import 'package:flutter_provider_demo/business_logic/models/tool/rate.dart';

abstract class StorageService {
  Future cacheExchangeRateData(List<Rate> data);

  Future<List<Rate>> getExchangeRateData();

  Future<List<Currency>> getFavoriteCurrencies();

  Future saveFavoriteCurrencies(List<Currency> data);

  Future<bool> isExpiredCache();
}