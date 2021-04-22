import 'package:final_project_e_commerce/model/model.dart';
import 'package:final_project_e_commerce/provider/products_provider.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class AddToCart extends StatelessWidget {

  final Product product;

  AddToCart({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProductsProvider provider = ProductsProvider();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Color(product.color) == Color(0xFFFFEB3B) ? Colors.black : Color(product.color),)
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Color(product.color) == Color(0xFFFFEB3B) ? Colors.black : Color(product.color),),
              onPressed: (){
                provider.put(product);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Produto inserido ao carrinho')));
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(product.color)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))
                    )
                ),
                onPressed: (){
                  /// Buy right now
                },
                child: Text(
                  'Comprar Agora'.toUpperCase(),
                  style: TextStyle(
                      color: Color(product.color) == Color(0xFFFFEB3B) ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}