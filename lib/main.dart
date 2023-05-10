import 'package:flutter/material.dart';
import 'package:kasuwa/provider/auth.dart';
import 'package:kasuwa/screens/auth_screen.dart';
import 'package:kasuwa/screens/edit_product_screen.dart';
import 'package:kasuwa/screens/order_screen.dart';
import 'package:kasuwa/screens/user_product_screen.dart';
import './provider/order.dart';
import './screens/cart_screen.dart';
import './provider/cart.dart';
import './provider/products_pro.dart';
import './screens/product_detail.dart';
import './screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (_) => ProductsP(),
        ),
      ChangeNotifierProvider(
        create: (_) => Cart(),),
      ChangeNotifierProvider(
        create: (_) => Orders(),),
      ChangeNotifierProvider(
        create: (_) => Auth(),),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.orange,
        ),
        home:  AuthScreen(),
        routes: {
          ProductDetails.routeName: (cxt) => ProductDetails(),
          CartScreen.routeName: (cxt) => CartScreen(),
          OrdersScreen.routeName: (cxt) => OrdersScreen(),
          UserProductScreen.routeName: (cxt) => UserProductScreen(),
          EditProductScreen.routeName: (cxt) => EditProductScreen()
        },
      ),
    );
  }
}


