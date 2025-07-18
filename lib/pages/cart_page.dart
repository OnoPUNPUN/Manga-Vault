import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_button.dart';
import 'package:minimal_shop/models/product_model.dart';
import 'package:minimal_shop/models/shop_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const String name = "/cart-page";

  // remove item frm cart method
  void removeItemFromCart(BuildContext context, ProductModel product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item from your cart?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),

          MaterialButton(
            onPressed: () {
              // pop the dialog box
              Navigator.pop(context);

              // add to cart
              context.read<ShopModel>().removeFromCart(product);
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  // user pressed the pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Payment system isn't ready yet ☠️☠️"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<ShopModel>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your cart is empty🤺🤺"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get indivual item in cart
                      final item = cart[index];

                      // return as a cart tile UI
                      return ListTile(
                        leading: Image.asset(item.imagePath),
                        title: Text(item.productName),
                        subtitle: Text(item.productPrice.toStringAsFixed(2)),
                        trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text("PAY NOW"),
            ),
          ),
        ],
      ),
    );
  }
}
