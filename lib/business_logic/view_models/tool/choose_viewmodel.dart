import 'package:flutter/foundation.dart';
import 'package:flutter_provider_demo/business_logic/models/tool/currency.dart';
import 'package:flutter_provider_demo/business_logic/models/tool/rate.dart';
import 'package:flutter_provider_demo/business_logic/utils/iso_data.dart';
import 'package:flutter_provider_demo/services/service_locator.dart';
import 'package:flutter_provider_demo/services/storage/tool/currency_service.dart';

class ChooseFavoritesViewModel extends ChangeNotifier {
  final CurrencyService _currencyService = serviceLocator<CurrencyService>();

  List<FavoritePresentation> _choices = [];
  List<Currency> _favorites = [];

  List<FavoritePresentation> get choices => _choices;

  void loadData() async {
    final rates = await _currencyService.getAllExchangeRates();
    _favorites = await _currencyService.getFavoriteCurrencies();
    _prepareChoicePresentation(rates);
    notifyListeners();
  }

  void _prepareChoicePresentation(List<Rate> rates) {
    List<FavoritePresentation> list = [];
    for (Rate rate in rates) {
      String code = rate.quoteCurrency;
      bool isFavorite = _getFavoriteStatus(code);
      list.add(FavoritePresentation(
        flag: IsoData.flagOf(code),
        alphabeticCode: code,
        longName: IsoData.longNameOf(code),
        isFavorite: isFavorite,
      ));
    }
    _choices = list;
  }

  bool _getFavoriteStatus(String code) {
    for (Currency currency in _favorites) {
      if (code == currency.isoCode) return true;
    }
    return false;
  }

  void toggleFavoriteStatus(int choiceIndex) {
    final isFavorite = !_choices[choiceIndex].isFavorite;
    final code = _choices[choiceIndex].alphabeticCode;

    // update display
    _choices[choiceIndex].isFavorite = isFavorite;

    // update favorite list
    if (isFavorite) {
      _addToFavorites(code);
    } else {
      _removeFromFavorites(code);
    }

    notifyListeners();
  }

  void _addToFavorites(String alphabeticCode) {
    _favorites.add(Currency(alphabeticCode));
    _currencyService.saveFavoriteCurrencies(_favorites);
  }

  void _removeFromFavorites(String alphabeticCode) {
    for (final currency in _favorites) {
      if (currency.isoCode == alphabeticCode) {
        _favorites.remove(currency);
        break;
      }
    }
    _currencyService.saveFavoriteCurrencies(_favorites);
  }
}

class FavoritePresentation {
  final String flag;
  final String alphabeticCode;
  final String longName;
  bool isFavorite;

  FavoritePresentation({
    this.flag,
    this.alphabeticCode,
    this.longName,
    this.isFavorite,
  });
}
