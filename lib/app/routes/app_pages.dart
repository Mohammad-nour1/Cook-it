import 'package:cookit/app/modules/home/home_view.dart';
import 'package:cookit/app/modules/splashs/splash_view.dart';
import 'package:get/get.dart';

import '../modules/search/search_view.dart';
import '../modules/countries/countries_view.dart';


part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH; 

  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashScreen()),
    GetPage(name: Routes.HOME, page: () => HomeScreen()),
    GetPage(name: Routes.SEARCH, page: () => SearchView()),
    GetPage(name: Routes.COUNTRIES, page: () => CountriesView()),
  ];
}
