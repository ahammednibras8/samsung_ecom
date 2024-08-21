import 'package:ecom/screens/intro_screens.dart';
import 'package:ecom/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    _controllerUsername.addListener(() {
      if (_errorMessage != null) {
        setState(() {
          _errorMessage = null;
        });
      }
    });
  }

  String? _formValidation(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
      return _errorMessage;
    }
    return null;
  }

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final prefrences = await SharedPreferences.getInstance();
      String? usernames = prefrences.getString('username');
      String? passwords = prefrences.getString('password');

      if (_controllerUsername.text == usernames &&
          _controllerPassword.text == passwords) {
        prefrences.setBool('isLogin', true);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const IntroScreens(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid Username or password'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Image.asset('assets/logo.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Galaxy AI',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Image.asset(
                    'assets/ai.png',
                    height: 28,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'is here',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 34),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controllerUsername,
                      validator: _formValidation,
                      forceErrorText: _errorMessage,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        hintText: 'username',
                        hintStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _controllerPassword,
                      validator: _formValidation,
                      forceErrorText: _errorMessage,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        hintText: 'password',
                        hintStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 23),
              GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  _login(context);
                },
                child: Container(
                  width: 330,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 23),
              GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IntroScreens(),
                    ),
                  );
                },
                child: Container(
                  width: 330,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Continue without Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
