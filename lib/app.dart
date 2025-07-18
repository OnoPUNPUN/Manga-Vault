import 'package:flutter/material.dart';
import 'package:minimal_shop/pages/cart_page.dart';
import 'package:minimal_shop/pages/intro_page.dart';
import 'package:minimal_shop/pages/shop_page.dart';
import 'package:minimal_shop/themes/light_mode.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        ShopPage.name: (context) => ShopPage(),
        IntroPage.name: (context) => IntroPage(),
        CartPage.name: (context) => CartPage(),
      },
    );
  }
}
