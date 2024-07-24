import 'package:first_pj/data/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/font_constants.dart';

class FutureProduct extends StatelessWidget {
  FutureProduct({super.key});

  final List<ProductEntity> products = ProductEntity.products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final image = AssetImage(products[index].imageAsset);
          final double rightPadding = index == products.length - 1 ? 15.0 : 0.0;
          return Padding(
            padding: EdgeInsets.only(left: 28.0, right: rightPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  products[index].name,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontConstants.productSans,
                      color: Color.fromRGBO(29, 31, 34, 1)),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$${products[index].price}",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontConstants.productSans,
                      color: Color.fromRGBO(29, 31, 34, 1)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
