import 'package:ecom/components/shop_card.dart';
import 'package:ecom/model/items.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class ShopScreen extends StatelessWidget {
  final Box<Items> itemsBox;

  const ShopScreen({super.key, required this.itemsBox});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 34),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 33,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.2,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 36),
          child: Text(
            'Explore all the new products from UNPACKED',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 34),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shop Now',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: itemsBox.length, // Use itemsBox length
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ShopCard(index: index);
            },
          ),
        )
      ],
    );
  }
}
