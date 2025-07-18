import 'package:flutter/material.dart';
import 'package:minimal_shop/app.dart';
import 'package:minimal_shop/models/shop_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShopModel(),
      child: const App(),
    ),
  );
}
