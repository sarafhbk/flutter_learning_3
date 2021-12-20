import 'package:flutter/material.dart';
import 'package:flutter_learning_3/providers/products.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider(
          create: (c) => products[i],
          child: const ProductItem(),
        );
      },
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
