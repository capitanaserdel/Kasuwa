import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../provider/order.dart' as ord;
class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

 OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {

  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(title: Text('\$${widget.order.amount}'),
        subtitle: Text(DateFormat('dd MM yyyy hh:mm:ss').format(widget.order.dateTime)),
        trailing:IconButton(
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        ) ,
        ),
        if (_expanded) Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
          height:min(widget.order.products.length * 20.0 + 10.0, 100.0 ) ,
        child: ListView(children: widget.order.products.map((ep) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ep.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text('${ep.quantity}x \$${ep.price}',style: TextStyle(fontSize: 18,color: Colors.grey))
          ],
        )).toList(),),
        )
      ],
      ),
    );
  }
}
