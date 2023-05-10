import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/add_drawer.dart';
import '../widget/order_item.dart';
import '../provider/order.dart' show Orders;

class OrdersScreen extends StatefulWidget {
 static const routeName = '/orders';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
late Future _orderFuture;

Future _loadedFuture(){
  return Provider.of<Orders>(context, listen: false).fetchAndSetOrder();
}

  @override
  void initState() {
    _orderFuture = _loadedFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('building future');
    // final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders'),),
        drawer: AppDrawer(),
        body:FutureBuilder(builder: (ctx, dataSnapshot) {
         if (dataSnapshot.connectionState == ConnectionState.waiting){
           return  Center( child: CircularProgressIndicator());
         } else{
           if (dataSnapshot.error != null){
                  return Center(child: Text('An error occurred!'));
           }else{
             return  Consumer<Orders>(builder: (ctx, ordersData, child) => ListView.builder(
                 itemCount: ordersData.orders.length,
                 itemBuilder: (cxt,i) => OrderItem(ordersData.orders[i])
             ));
           }
         }
        },
          future:_orderFuture,

        )
    );
  }
}
