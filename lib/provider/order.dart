import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    var url = Uri.parse(
        'https://kasuwadb-787d9-default-rtdb.firebaseio.com/products.json?AIzaSyDO99Q5nW_ZRpG_ifnXM8AQMhomVlYL63k');
    final timestamp = DateTime.now();
  final response = await http.post(url,body: json.encode({
      'amount':total,
      'dateTime':timestamp.toIso8601String(),
      'product': cartProducts.map((cp) => {
        'id':cp.id,
        'title':cp.title,
        'quantity':cp.quantity,
        'price':cp.price
      }).toList()
    }));
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
  // Future<void> addProduct(Product product) async {
  //   Map data = {
  //     'title': product.title,
  //     'description': product.description,
  //     'imageUrl': product.imageUrl,
  //     'price': product.price,
  //     'isFavorite': product.isFavorite,
  //   };
  //   print(data);
  //
  //   String body = json.encode(data);
  //   var url = Uri.parse(
  //       'https://kasuwadb-787d9-default-rtdb.firebaseio.com/products.json?AIzaSyDO99Q5nW_ZRpG_ifnXM8AQMhomVlYL63k');
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "accept": "application/json",
  //       },
  //       body: body,
  //     );
  //     final newProduct = Product(
  //         id: json.decode(response.body)['name'],
  //         title: product.title,
  //         description: product.description,
  //         price: product.price,
  //         imageUrl: product.imageUrl);
  //     _items.add(newProduct);
  //     // _items.insert(0, newProduct); // at the start of the list
  //     notifyListeners();
  //   } catch (error) {
  //     print(error);
  //     throw (error);
  //   }
  // }
}
