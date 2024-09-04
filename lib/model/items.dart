import 'package:hive/hive.dart';

part 'items.g.dart';

@HiveType(typeId: 0)
class Items extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String image;

  Items({required this.name, required this.price, required this.image});
}
