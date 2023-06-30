

import 'package:flutter/material.dart';
import 'package:the_news_app/NewsAPI/constants/color_constants.dart';

import 'package:the_news_app/NewsAPI/constants/ui_constants.dart';
import 'package:the_news_app/NewsAPI/views/login_screen.dart';
import 'package:the_news_app/NewsAPI/views/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset('lib/NewsAPI/assets/images/news_image.jpg',
                fit: BoxFit.cover),
          ),
          Center(
            child: Card(
          
              color: AppColors.lightGrey,
              shadowColor: Colors.white,
              elevation: 70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
          
              ),
              child: SizedBox(
                height:200,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      }, 
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(120, 50))
                      ),
                      child: const Text('Login')),
                    vertical20,
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    }, child: const Text('Sign Up'),style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(120, 50))
                      ),)
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
