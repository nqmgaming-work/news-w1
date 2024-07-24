import 'dart:ffi';

class ProductEntity {
  final int id;
  final String name;
  final double price;
  final String imageAsset;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imageAsset,
  });

  static List<ProductEntity> products = [
    ProductEntity(id: 1, name: 'Turtleneck Sweater', price: 39.99, imageAsset: 'assets/images/product1.png'),
    ProductEntity(id: 3, name: 'Long Sleeve Dress', price: 45.0, imageAsset: 'assets/images/product3.png'),
    ProductEntity(id: 4, name: 'Sportwear Set', price: 80.0, imageAsset: 'assets/images/product4.png'),
  ];

  static List<ProductEntity> recommended = [
    ProductEntity(id: 1, name: 'White fashion hoodie', price: 29.0, imageAsset: 'assets/images/product6.png'),
    ProductEntity(id: 2, name: 'Cotton T-shirt', price: 30.0, imageAsset: 'assets/images/product5.png'),
  ];
}
