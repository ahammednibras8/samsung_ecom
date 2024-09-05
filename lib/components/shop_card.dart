import 'package:ecom/model/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class ShopCard extends StatefulWidget {
  final int index;

  const ShopCard({super.key, required this.index});

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  late final Box<dynamic> _shopItems;
  late final Box<dynamic> _cartItems;

  @override
  void initState() {
    super.initState();
    _shopItems = Hive.box<dynamic>('itemsBox');
    _cartItems = Hive.box<dynamic>('cartBox');
  }

  void addToCart(Items item) {
    final existingItems = _cartItems.values.toList();

    if (!existingItems.contains(item)) {
      _cartItems.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = _shopItems.getAt(widget.index) as Items;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Column(
                children: [
                  Image.asset(_shopItems.get(widget.index).image),
                ],
              ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23, bottom: 23),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _shopItems.get(widget.index).name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '₹${_shopItems.get(widget.index).price}',
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      addToCart(item);
                    });

                    HapticFeedback.vibrate();

                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text('Item Added To Cart'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: 72,
                    width: 72,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                      weight: 90,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
