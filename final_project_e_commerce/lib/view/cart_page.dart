import 'package:final_project_e_commerce/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:final_project_e_commerce/components/components.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ProductsProvider products = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Suas Compras'),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
                /// go to API to payment you debits
              }
          )
        ],
      ),
      body: _validate(products)
    );
  }

  _validate(ProductsProvider products){
  return products.all.length == 0
    ? _rowDontProductsInCart(products)
    : _buildListView(products);
  }

  _rowDontProductsInCart(ProductsProvider products) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://i.pinimg.com/originals/64/99/4e/64994e619df22acf0ee566799d72365a.png',
                  width: 100,
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Voce ainda não tem produtos no carrinho', textAlign: TextAlign.center ,style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        );
  }

  _buildListView(ProductsProvider products) {
    return ListView.builder(
      itemCount: products.all.length,
      itemBuilder: (context, index) =>
          CartProductsListTile(product: products.byIndex(index)),
    );
  }
}
