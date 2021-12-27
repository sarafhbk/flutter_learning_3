import 'package:flutter/material.dart';
import 'package:flutter_learning_3/widgets/product_grid.dart';

enum FilterOptions { favourites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.favourites) {
                    _showOnlyFavourites = true;
                  } else {
                    _showOnlyFavourites = false;
                  }
                });
              },
              child: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('Only Favourites'),
                      value: FilterOptions.favourites,
                    ),
                    const PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.all,
                    ),
                  ])
        ],
      ),
      body: ProductGrid(showOnlyFavs: _showOnlyFavourites),
    );
  }
}
