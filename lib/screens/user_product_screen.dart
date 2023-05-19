import 'package:flutter/material.dart';
import 'package:kasuwa/provider/products_pro.dart';
import 'package:kasuwa/widget/user_product_item.dart';
import 'package:provider/provider.dart';

import '../widget/add_drawer.dart';
import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductsP>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    // final prodtct = Provider.of<ProductsP>(
    //   context,
    // );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Product'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: _refreshProducts(context),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: () => _refreshProducts(context),
                      child: Consumer<ProductsP>(
                        builder: (ctx, prodtct, _) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount: prodtct.items.length,
                              itemBuilder: (ctx, i) => Column(
                                    children: [
                                      UserProductItem(
                                        prodtct.items[i].id,
                                        prodtct.items[i].title,
                                        prodtct.items[i].imageUrl,
                                      ),
                                      Divider()
                                    ],
                                  )),
                        ),
                      ),
                    ),
        ));
  }
}
