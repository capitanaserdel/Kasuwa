import 'package:flutter/material.dart';
import '../provider/order.dart';
import 'package:provider/provider.dart';
import '../widget/cart_item.dart';
import '../provider/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {  
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
             child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  orderBtn(cart: cart),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, i) => CartItem(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i] ,
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title,
                  )))
        ],
      ),
    );
  }
}

class orderBtn extends StatefulWidget {
  const orderBtn({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  State<orderBtn> createState() => _orderBtnState();
}

class _orderBtnState extends State<orderBtn> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed:( widget.cart.totalAmount <= 0 || _isLoading) ? null : () async {
        setState(() {
          _isLoading = true;
        });
       await Provider.of<Orders>(context,listen: false).addOrder(
            widget.cart.items.values.toList(),
            widget.cart.totalAmount,
        );
        setState(() {
          _isLoading = false;
        });
        widget.cart.clear();
      },
      child: _isLoading ? CircularProgressIndicator() : Text(
        'ORDER NOW',
      ),
    );
  }
}
