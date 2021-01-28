import 'package:flutter_provider_demo/business_logic/models/tool/currency.dart';
import 'package:flutter_provider_demo/business_logic/models/tool/rate.dart';
import 'package:flutter_provider_demo/services/apis/tools/calculateApis.dart';

import '../../service_locator.dart';
import 'calculate_service.dart';
import 'currency_service.dart';

// This class is the concrete implementation of [CurrencyService]. It is a
// wrapper around the WebApi and StorageService services. This way the view models
// don't actually have to know anything about the web or storage details.
class CurrencyServiceImpl implements CurrencyService {
  StorageService _storageService = serviceLocator<StorageService>();
  CalculateApis _calculateApis = CalculateApis();
  static final defaultFavorites = [Currency('CNY'), Currency('USD')];

  @override
  Future<List<Rate>> getAllExchangeRates({String base}) async {
    List<Rate> webData = await _calculateApis.fetchExchangeRates();
    if (base != null) {
      return _convertBaseCurrency(base, webData);
    }
    return webData;
  }

  @override
  Future<List<Currency>> getFavoriteCurrencies() async {
    final favorites = await _storageService.getFavoriteCurrencies();
    if (favorites == null || favorites.length <= 1) {
      return defaultFavorites;
    }
    return favorites;
  }

  List<Rate> _convertBaseCurrency(String base, List<Rate> remoteData) {
    if (remoteData[0].baseCurrency == base) {
      return remoteData;
    }
    double divisor = remoteData
        .firstWhere((rate) => rate.quoteCurrency == base)
        .exchangeRate;
    return remoteData
        .map((rate) => Rate(
              baseCurrency: base,
              quoteCurrency: rate.quoteCurrency,
              exchangeRate: rate.exchangeRate / divisor,
            ))
        .toList();
  }

  @override
  Future<void> saveFavoriteCurrencies(List<Currency> data) async {
    if (data == null || data.length == 0) return;
    await _storageService.saveFavoriteCurrencies(data);
  }
}
