import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_news_app/NewsAPI/utils/app_routes.dart';
import 'package:the_news_app/NewsAPI/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_news_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
  runApp(const MaterialApp(home:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The News App',
      theme: Themes.appTheme,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}