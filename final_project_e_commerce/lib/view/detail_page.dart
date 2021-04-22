import 'package:final_project_e_commerce/components/components.dart';
import 'package:final_project_e_commerce/constant.dart';
import 'package:final_project_e_commerce/model/model.dart';
import 'package:final_project_e_commerce/provider/products_provider.dart';
import 'package:final_project_e_commerce/view/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {

  final Product product;

  DetailPage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ProductsProvider products = Provider.of(context);

    return Scaffold(
      backgroundColor: Color(product.color),
      appBar: _rowAppBar(context, products),
      body: BodyDetail(product: product,),
    );
  }

  _rowAppBar(BuildContext context, ProductsProvider productsProvider) {

    TextEditingController _searchController = TextEditingController();

    return AppBar(
      backgroundColor: Color(product.color),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_outlined,
          color: Color(product.color) == Color(0xFFFFEB3B) ? kTextColor : Colors.white,
        ),
        /// navegação apartir do stado da tela usando BloC
        onPressed: () => Navigator.pop(context),
      ),
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Color(product.color) == 0xFFFFEB3B ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(5)
        ),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Pesquisar',
            hintStyle: TextStyle(color: kTextLightColor, height: 2.5),
          ),
          onSubmitted: (text) {
            ///fazendo a pesquisa por produtos na appbar
            /// se pesquisar barra vazia retorna todos os produtos da loja
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ainda não pesquisa mais quase RELAXA CALMA SEGURA ESSA IDEIA...')));
            _searchController.clear();
          },
          keyboardType: TextInputType.text,
          controller: _searchController,
          // decoration: InputDecoration(
          //   border: OutlineInputBorder(),
          //   labelText: 'Pesquisar',
          // ),
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.search,
              color: Color(product.color) == Color(0xFFFFEB3B) ? kTextColor : Colors.white,),
            onPressed: () {
              /// fazer pesquisa por produto usando o BloC
            }),
        IconButton(
            icon: Icon(Icons.shopping_cart,
              color: Color(product.color) == Color(0xFFFFEB3B) ? kTextColor : Colors.white,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
            }
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}

