
import 'package:flutter/material.dart';
import 'package:kasuwa/provider/products_pro.dart';
import 'package:kasuwa/widget/product_item.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';

class ProductGrid extends StatelessWidget {
late final bool showFav;
ProductGrid(this.showFav);
  @override
  Widget build(BuildContext context) {
   final productspData = Provider.of<ProductsP>(context);
   final productsp = showFav ? productspData.favorite : productspData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productsp.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (cxt, i) => ChangeNotifierProvider.value(
         value : productsp[i],
          child: Productitem(
              // productsp[i].id,
              // productsp[i].title,
              // productsp[i].imageUrl
          ),
        ));
  }
}