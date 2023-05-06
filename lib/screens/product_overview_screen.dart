import 'package:flutter/material.dart';
import 'package:kasuwa/provider/products_pro.dart';
import 'package:kasuwa/screens/cart_screen.dart';
import 'package:kasuwa/widget/badge.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../widget/add_drawer.dart';
import '../widget/product_grid.dart';


enum FilterOptions{
  Favorite,
  All
}
class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoriteOnly =false;
  @override
  Widget build(BuildContext context) {
    // final prodCont = Provider.of<ProductsP>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Kasuwa'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue){
              setState(() {
                if (selectedValue == FilterOptions.Favorite){
                  _showFavoriteOnly = true;
                }else{
                  _showFavoriteOnly = false;
                }
              });
            },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) =>
                  [
                    PopupMenuItem(child: Text('Only Favorites'),value:FilterOptions.Favorite),
                    PopupMenuItem(child: Text('Show All'),value:FilterOptions.All,),
                  ]),
           Consumer<Cart>(
             builder: (_, cart ,ch) => Bagde(
               value: cart.itemC.toString(),
             color: Theme.of(context).accentColor,
             child:ch!
             ),
             child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () { 
               Navigator.of(context).pushNamed(CartScreen.routeName);
             },) ,
           )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
