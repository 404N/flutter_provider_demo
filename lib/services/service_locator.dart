import 'package:flutter_provider_demo/business_logic/view_models/home_index_viewmodel.dart';
import 'package:flutter_provider_demo/business_logic/view_models/note_viewmodel.dart';
import 'package:flutter_provider_demo/ui/home_page.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  // serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());
  // serviceLocator.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceImpl());

  // You can replace the actual services above with fake implementations during development.

  // view models
  serviceLocator.registerFactory<HomeIndexViewModel>(() => HomeIndexViewModel());
  serviceLocator.registerFactory<NoteViewModel>(() => NoteViewModel());
}