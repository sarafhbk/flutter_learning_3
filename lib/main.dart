import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/product_detail_screen.dart';
import 'screens/products_overview_screen.dart';
import 'providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Products(),
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(primary: Colors.purple, secondary: Colors.deepOrange),
          fontFamily: 'Lato',
        ),
        routes: {
          '/': (ctx) => const ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen()
        },
      ),
    );
  }
}
