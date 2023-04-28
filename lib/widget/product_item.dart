import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../provider/product.dart';
import '../screens/product_detail.dart';

class Productitem extends StatelessWidget {
  // late final String id;
  // late final String title;
  // late final String imageUrl;
  //
  // Productitem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetails.routeName, arguments: pro.id);
        },
        child: GridTile(
          child: Image.network(
            pro.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (ctx, pro, _) => IconButton(
                  onPressed: () {
                    pro.toggleFavoriteStatus();
                  },
                  icon: Icon(
                      pro.isFavorite ? Icons.favorite : Icons.favorite_border),
                  color: Theme.of(context).accentColor),
            ),
            title: Text(
              pro.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black87,
            trailing: Consumer<Cart>(
              builder: (ctx, cart, _) => IconButton(
                onPressed: () {
                  cart.addItems(pro.id, pro.price, pro.title);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added items to cart!'),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(label: 'UNDO', onPressed: (){
                          cart.removeSingleItem(pro.id);
                        }),
                      ));
                },
                icon: Icon(Icons.shopping_cart),
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
