import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';
import 'package:value_notifier_class/src/products/services/products_service.dart';

import 'home/home_page.dart';
import 'products/product_page.dart';
import 'products/stores/product_store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Uno()),
        Provider(create: (context) => ProductService(context.read())),
        ChangeNotifierProvider(create: (context) => ProductStore(context.read())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductPage(),
      ),
    );
  }
}
