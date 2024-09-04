import 'package:ecom/model/items.dart';
import 'package:hive/hive.dart';

part 'cart_items.g.dart';

@HiveType(typeId: 1)
class CartItems extends HiveObject {
  @HiveField(0)
  late Items items;

  CartItems({required this.items});
}