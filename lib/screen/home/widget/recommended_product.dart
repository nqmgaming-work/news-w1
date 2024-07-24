import 'package:first_pj/data/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/font_constants.dart';

class RecommendedProduct extends StatelessWidget {
  RecommendedProduct({super.key});

  final List<ProductEntity> products = ProductEntity.recommended;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final image = AssetImage(products[index].imageAsset);
          final double rightPadding = index == products.length - 1 ? 15.0 : 0.0;
          return Padding(
            padding: EdgeInsets.only(left: 16.0, right: rightPadding),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23),
              ),
              color: Colors.white,
              elevation: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
