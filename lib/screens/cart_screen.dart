import 'dart:developer';

import 'package:ecom/components/cart_card.dart';
import 'package:ecom/model/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final Box<Items> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems = Hive.box<Items>('cartBox');
  }

  void refreshCart() {
    setState(() {});

    HapticFeedback.vibrate();

    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Item Removed From Cart'),
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
  }

  @override
  Widget build(BuildContext context) {
    log(_cartItems.toString());
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: _cartItems.isEmpty
          ? const Center(
              child: Text(
                'No Items In The Cart',
                style: TextStyle(color: Colors.amberAccent),
              ),
            )
          : ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                return CartCard(
                  itemId: index,
                  onDelete: () {
                    setState(
                      () {
                        _cartItems.deleteAt(index);
                      },
                    );
                    refreshCart();
                  },
                );
              },
            ),
    );
  }
}
