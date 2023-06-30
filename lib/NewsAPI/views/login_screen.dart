import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_news_app/NewsAPI/constants/color_constants.dart';
import 'package:the_news_app/NewsAPI/constants/ui_constants.dart';
import 'package:the_news_app/NewsAPI/views/forget_password.dart';
import 'package:the_news_app/NewsAPI/views/home_page.dart';
import 'package:the_news_app/NewsAPI/views/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
/*
  Future<void> signInGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if(googleSignInAccount != null){
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );
      UserCredential result = await auth.signInWithCredential(authCredential);
      

      if(result.user != null){
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }*/

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage(),),);
      }
    }
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "" || password == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter the details asked to access the app.'),
      ));
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      } on FirebaseAuth {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('An error occured during login please try again')));
        Navigator.pop(context,
            MaterialPageRoute(builder: (context) => const SplashScreen()));
      }
    }
  }

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
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  gapPadding: 4.0),
                              labelText: 'Password',
                              hintText: 'Enter your password'),
                        ),
                        vertical20,
                        ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size(120, 50))),
                            child: const Text('Login')),
                        
                        TextButton(onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()));
                        }, child: const Text('Forget Password ?')),
                        
                        ElevatedButton(
                            onPressed: () {
                              signup(context);
                            },
                            style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size(120, 50))),
                            child: const Text('Login using Google'))
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
