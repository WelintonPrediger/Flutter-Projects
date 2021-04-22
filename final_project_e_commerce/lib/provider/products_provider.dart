import 'dart:math';
import 'package:final_project_e_commerce/data/service_products_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:final_project_e_commerce/model/model.dart';

class ProductsProvider with ChangeNotifier {

  final Map<int, Product> _items = serviceProductsInCart;

  List<Product> get all {
            /// operador spread procurar mais informações a respeito
            /// serve para clonar o '_items'
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Product byIndex(int index) {
    return _items.values.elementAt(index);
  }

  put(Product product) {
    if(product == null){
      return;
    }

    for(int i = 0; i < _items.length; i++){
      if(_items.values.elementAt(i).title == product.title){
        return;
      }
    }

    final id = Random().nextInt(100).toString();

    _items.putIfAbsent(
        int.tryParse(id),
            () => Product(
                id: int.tryParse(id),
                image: product.image,
                title: product.title,
                description: product.description,
                price: product.price,
                size: product.size,
                color: product.color));

    notifyListeners();
  }

  remove(Product product) {
    if(product != null && product.id != null) {
      _items.remove(product.id);
      notifyListeners();
    }
  }

}