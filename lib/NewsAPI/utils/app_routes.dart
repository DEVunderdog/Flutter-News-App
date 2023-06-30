
import 'package:get/get.dart';
import 'package:the_news_app/NewsAPI/views/home_page.dart';
import 'package:the_news_app/NewsAPI/views/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static const initial = '/splashScreen';
  static final routes = [
    GetPage(name: '/splashScreen', page: () => const SplashScreen(), transition: Transition.zoom),
    GetPage(name: '/homePage', page: () =>  HomePage(), transition: Transition.fadeIn)
  ];
}