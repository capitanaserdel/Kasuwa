import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  void _setfavValue(bool newValue){
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {
    final oldStatus = isFavorite;
    var url = Uri.parse(
        'https://kasuwadb-787d9-default-rtdb.firebaseio.com/products/$id.json?AIzaSyDO99Q5nW_ZRpG_ifnXM8AQMhomVlYL63k');
    isFavorite = !isFavorite;
    notifyListeners();
    try {
    final response =  await http.patch(url, body: json.encode({'isFavorite': isFavorite}));
    if (response.statusCode >= 400){
    _setfavValue(oldStatus);
    }
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
