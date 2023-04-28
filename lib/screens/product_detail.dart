import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products_pro.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/product';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments;
    final productspData =
        Provider.of<ProductsP>(context, listen: false).findById(productId!);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(productspData.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: h * 0.5,
                width: w,
                child: Image.network(
                  productspData.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: h * 0.024,
              ),
              Text(
                '\$${productspData.price}',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(
                height: h * 0.024,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10 ),
                width: w,
                  child: Text(
                productspData.description,
                textAlign: TextAlign.center,
                softWrap: true,
              )),
            ],
          ),
        ));
  }
}
