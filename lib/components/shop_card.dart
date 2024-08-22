import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            Column(
              children: [
                Image.asset('assets/ultra.png'),
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 23, bottom: 23),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'S24 ULTRA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '₹129999.00',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Container(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}