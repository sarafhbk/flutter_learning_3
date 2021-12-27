import 'package:flutter/material.dart';
import 'package:flutter_learning_3/providers/products.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showOnlyFavs;
  const ProductGrid({Key? key, required this.showOnlyFavs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products =
        showOnlyFavs ? productData.favouriteItems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider.value(
          value: products[i],
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
