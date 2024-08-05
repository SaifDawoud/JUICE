import 'dart:ui';

class JuiceEntity {
  final String name;
  final String image;
  final String price;
  final Color color;

  JuiceEntity({
    required this.name,
    required this.image,
    required this.price,
    required this.color,
  });
}

final juiceList = [
  JuiceEntity(
    name: 'Besom Yellow Juice',
    image: 'https://flutter4fun.com/wp-content/uploads/2021/09/juice1.png',
    price: '19.99',
    color: Color(0xFFF3BE39),
  ),
  JuiceEntity(
    name: 'Besom Orange Juice',
    image: 'https://flutter4fun.com/wp-content/uploads/2021/09/juice2.png',
    price: '25.99',
    color: Color(0xFFDC691F),
  ),
  JuiceEntity(
    name: 'Besom Yellow Juice',
    image: 'https://flutter4fun.com/wp-content/uploads/2021/09/full.png',
    price: '100.00',
    color: Color(0xFFF3BE39),
  ),
  // JuiceEntity(
  //   name: 'Besom Orange Juice',
  //   image: 'https://flutter4fun.com/wp-content/uploads/2021/09/juice2.png',
  //   price: '25.99',
  //   color: Color(0xFFDC691F),
  // ),
];

final reviewImages = [
  "https://www.lovepanky.com/wp-content/uploads/2018/08/How-to-Be-Cool.jpg",
  "https://imgix.bustle.com/uploads/image/2021/7/16/07062a59-9fd1-41f8-9c99-e4c0f5d80c05-06546552-d025-4a16-ab18-d252ff01fa90-getty-1205000579.jpeg?w=800",
  "https://www.shutterstock.com/image-photo/young-handsome-man-beard-wearing-600nw-1768126784.jpg",
  "https://www.lovepanky.com/wp-content/uploads/2018/08/How-to-Be-Cool.jpg",
];
