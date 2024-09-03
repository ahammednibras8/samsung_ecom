class Items {
  final String name;
  final String price;
  final String image;

  Items({required this.name, required this.price, required this.image});
}

List<Items> items = [
  Items(
    name: 'S24 ULTRA',
    price: '129999.00',
    image: 'assets/ultra.png',
  ),
  Items(
    name: 'Galaxy Watch Ultra',
    price: '59999.00',
    image: 'assets/watch.png',
  ),
  Items(
    name: 'Galaxy Z Flip 6',
    price: '109999.00',
    image: 'assets/flip.png',
  ),
  Items(
    name: 'Galaxy Buds 3',
    price: '14999.00',
    image: 'assets/buds.png',
  ),
  Items(
    name: 'Galaxy Z Flod 6',
    price: '164999.00',
    image: 'assets/fold.png',
  ),
];
