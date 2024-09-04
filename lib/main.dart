import 'package:ecom/screens/intro_screens.dart';
import 'package:ecom/screens/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;
import 'package:shared_preferences/shared_preferences.dart';

import 'model/cart_items.dart';
import 'model/items.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final bool isLogin = preferences.getBool('isLogin') ?? false;

  //Local Database
  final appDatabase = await PathProvider.getApplicationDocumentsDirectory();

  //Initilizing Hive
  if (kIsWeb) {
    final storage = await PathProvider.getApplicationDocumentsDirectory();
    Hive.init(storage.path);
  } else {
    await Hive.initFlutter(appDatabase.path);
    if (!Hive.isAdapterRegistered(CartItemsAdapter().typeId)) {
      Hive.registerAdapter(CartItemsAdapter());
    }
    if (!Hive.isAdapterRegistered(ItemsAdapter().typeId)) {
      Hive.registerAdapter(ItemsAdapter());
    }
  }

  await Hive.openBox('cartBox');
  await Hive.openBox('itemsBox');

  runApp(
    MainApp(
      isLogin: isLogin,
    ),
  );
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