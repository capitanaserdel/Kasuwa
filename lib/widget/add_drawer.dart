import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasuwa/screens/order_screen.dart';
import 'package:kasuwa/screens/user_product_screen.dart';
import 'package:provider/provider.dart';

import '../provider/auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(children: [
      AppBar(
        title: Text('Hello Friend'),
        automaticallyImplyLeading: false,
      ),
      Divider(),
      ListTile(leading: Icon(Icons.shop),title: Text('Shop'),
      onTap: (){
        Navigator.of(context).pushReplacementNamed('/');
      } ,
      ),
      Divider(),
      ListTile(leading: Icon(Icons.payment),title: Text('Orders'),
        onTap: (){
          Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
        } ,
      ),
      const Divider(),
      ListTile(leading: Icon(Icons.edit  ),title: Text('Manage Products'),
        onTap: (){
          Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
        } ,
      ),
      Divider(),
      ListTile(leading: Icon(Icons.exit_to_app ),title: Text('Logout'),
        onTap: (){
        Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed('/');
          Provider.of<Auth>(context, listen: false).logout();
        } ,
      ),
    ],),);
  }
}
