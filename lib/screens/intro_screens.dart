import 'package:ecom/model/items.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class IntroScreens extends StatelessWidget {
  const IntroScreens({super.key});

  void loadingItems() async {
    final _shopItems = Hive.box('itemsBox');

    if (_shopItems.isEmpty) {
      final itemsList = [
        Items(name: 'S24 ULTRA', price: '129999', image: 'assets/ultra.png'),
        Items(name: 'Galaxy Z Flip 6', price: '109999', image: 'assets/flip.png'),
        Items(name: 'Galaxy Buds 3', price: '14999', image: 'assets/buds.png'),
        Items(name: 'Galaxy Watch Ultra', price: '59999',image: 'assets/watch.png'),
        Items(name: 'Galaxy Z Fold 6', price: '164999', image: 'assets/fold.png'),
      ];

      for (var item in itemsList) {
        await _shopItems.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Galaxy AI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  'assets/ai.png',
                  height: 50,
                ),
                const SizedBox(width: 8),
                const Text(
                  'is here',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                )
              ],
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                'Explore all the new products from UNPACKED',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: InkWell(
                onTap: () {
                  loadingItems();
                  HapticFeedback.lightImpact();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: 450,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
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
