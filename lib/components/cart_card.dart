import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_slidable/flutter_slidable.dart';

class CartCard extends StatelessWidget {
  final int itemId;
  final VoidCallback onDelete;
  const CartCard({super.key, required this.itemId, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final _cartItems = Hive.box('cartBox');
    final item = _cartItems.getAt(itemId);

    if (item == null) {
      return const Text('404 item Not Found');
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                onDelete;
              },
              label: 'Delete',
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.asset(item.image),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(item.name),
                  Text(item.price),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
