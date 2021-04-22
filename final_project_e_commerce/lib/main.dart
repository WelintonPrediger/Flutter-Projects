import 'package:final_project_e_commerce/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/view.dart';

void main() {
  runApp(ChangeNotifierProvider(
    /// usando pattern 'Observer'
    create: (context) => ProductsProvider(),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Final Project',
        home: HomePage()
      ),
    ),
  );
}