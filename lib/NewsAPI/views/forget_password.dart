
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_news_app/NewsAPI/constants/color_constants.dart';
import 'package:the_news_app/NewsAPI/constants/ui_constants.dart';
import 'package:the_news_app/NewsAPI/views/splash_screen.dart';

class ForgetPasswordScreen extends StatefulWidget{
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>{

  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
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
                elevation: 100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SizedBox(
                  height: 350,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  gapPadding: 4.0),
                              labelText: 'Email',
                              hintText: 'Enter your email'),
                        ),
                        vertical20,
                        ElevatedButton(
                            onPressed: () {
                              auth.sendPasswordResetEmail(email: emailController.text.trim().toString()).then((value){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
                              }).onError((error, stackTrace) {
                                print(error.toString());
                              });
                            },
                            style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size(120, 50))),
                            child: const Text('Send Link')),
                        vertical20,
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}