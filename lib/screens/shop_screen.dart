import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Focus.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: const Center(
          child: TextField(),
        ),
      ),
    );
  }
}
