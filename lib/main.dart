import 'package:ecom/screens/intro_screens.dart';
import 'package:ecom/screens/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: library_prefixes
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
    Hive.initFlutter();
  } else {
    await Hive.initFlutter(appDatabase.path);
    if (!Hive.isAdapterRegistered(CartItemsAdapter().typeId)) {
      Hive.registerAdapter(CartItemsAdapter());
    }
    if (!Hive.isAdapterRegistered(ItemsAdapter().typeId)) {
      Hive.registerAdapter(ItemsAdapter());
    }
  }

  final cartBox = await Hive.openBox<CartItems>('cartBox');
  final itemsBox = await Hive.openBox<Items>('itemsBox'); // Open the box here

  runApp(
    MainApp(
      isLogin: isLogin,
      cartBox: cartBox,
      itemsBox: itemsBox, // Pass the opened box here
    ),
  );
}

class MainApp extends StatelessWidget {
  final bool isLogin;
  final Box<CartItems> cartBox;
  final Box<Items> itemsBox;
  const MainApp({
    super.key,
    required this.isLogin,
    required this.cartBox,
    required this.itemsBox,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin ? IntroScreens(cartBox: cartBox, itemsBox: itemsBox,) : const LoginScreen(),
    );
  }
}

//zoom drawer Package
//Curved Animation bar
//Carosel Slider