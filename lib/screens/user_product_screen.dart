import 'package:flutter/material.dart';
import 'package:kasuwa/provider/products_pro.dart';
import 'package:kasuwa/widget/user_product_item.dart';
import 'package:provider/provider.dart';

import '../widget/add_drawer.dart';

class UserProductScreen extends StatelessWidget {
static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final prodtct = Provider.of<ProductsP>(context,);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        actions: [
          IconButton(onPressed: (){}, icon:  const Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: prodtct.items.length,
            itemBuilder: (ctx,i) => Column(
              children: [
                UserProductItem(prodtct.items[i].title,prodtct.items[i].id,),
                Divider()
              ],
            )),
      )
    );
  }
}
