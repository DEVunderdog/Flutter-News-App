import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_news_app/NewsAPI/constants/color_constants.dart';
import 'package:the_news_app/NewsAPI/constants/ui_constants.dart';
import 'package:the_news_app/NewsAPI/views/home_page.dart';
import 'package:the_news_app/NewsAPI/views/splash_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void createAccount() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String cPassword = cPasswordController.text.trim();

      if (email == "" || password == "" || cPassword == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill up the details.')));
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          if (userCredential.user != null) {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        } on FirebaseAuthException{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content:
                  Text('An error occured during sign up please try again')));
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const SplashScreen()));
        }
      }
    }

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
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: emailController,
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              gapPadding: 4.0
                            ),
                            labelText: 'Email',
                            hintText: 'Enter your email'
                          ),
                        ),
                        vertical20,
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              gapPadding: 4.0
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your password'
                          ),
                        ),
                        vertical20,
                        TextField(
                          obscureText: true,
                          controller: cPasswordController,
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              gapPadding: 4.0
                            ),
                            labelText: 'Confirm Password',
                            hintText: 'Confirm your password'
                          ),
                        ),
                        vertical20,
                  
                        ElevatedButton(
                          onPressed: (){
                            createAccount();
                          }, 
                          style:ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(120, 50))
                        ),
                          child: const Text('Sign up'))
                  
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
