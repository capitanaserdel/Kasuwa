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
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) => {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders'),),
        drawer: AppDrawer(),
        body: ListView.builder(
        itemCount: ordersData.orders.length,
          itemBuilder: (cxt,i) => OrderItem(ordersData.orders[i])
        ),
    );
  }
}
