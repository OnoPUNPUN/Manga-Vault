import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_list_tile.dart';
import 'package:minimal_shop/pages/cart_page.dart';
import 'package:minimal_shop/pages/intro_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Theme(
        data: Theme.of(
          context,
        ).copyWith(dividerTheme: DividerThemeData(color: Colors.transparent)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // drawer header: logo
            Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(border: null),
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 72,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                //shop tile
                MyListTile(
                  title: "Shop",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context),
                ),

                // cart tile
                MyListTile(
                  title: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    // pop drawer
                    Navigator.pop(context);

                    // go to cart page
                    Navigator.pushNamed(context, CartPage.name);
                  },
                ),
              ],
            ),
            // exit shop tile
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyListTile(
                title: "Exit",
                icon: Icons.logout,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  IntroPage.name,
                  (predicate) => false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
