import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_drawer.dart';
import 'package:minimal_shop/components/my_product_tile.dart';
import 'package:minimal_shop/models/shop_model.dart';
import 'package:minimal_shop/pages/cart_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  static const String name = "/shop-page";

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ShopModel>().shop;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Page'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // go to cart button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, CartPage.name),
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 25),

          // shop subtitle
          Center(
            child: Text(
              "Pick from a seleted list of premium Manga",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // prodcut list
          SizedBox(
            height: 650,
            child: ListView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get each individual product from shop
                final product = products[index];
                // return as product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
