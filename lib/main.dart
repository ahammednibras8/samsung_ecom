import 'package:ecom/screens/intro_screens.dart';
import 'package:ecom/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final bool isLogin = preferences.getBool('isLogin') ?? false;
  runApp(MainApp(
    isLogin: isLogin,
  ));
}

class MainApp extends StatelessWidget {
  final bool isLogin;
  const MainApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin ? const IntroScreens() : const LoginScreen(),
    );
  }
}

//zoom drawer Package
//Curved Animation bar
//Carosel Slider