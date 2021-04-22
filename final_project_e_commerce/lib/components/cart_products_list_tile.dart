import 'package:final_project_e_commerce/components/cart_counter.dart';
import 'package:final_project_e_commerce/constant.dart';
import 'package:final_project_e_commerce/model/model.dart';
import 'package:final_project_e_commerce/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProductsListTile extends StatelessWidget {

  Product product;

  CartProductsListTile({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _alert() {
      AlertDialog alert = AlertDialog(
        title: Text('Oh nosso produto é tão legal'),
        content: Text('Deseja realmente excluir o produto?'),
        actions: [
          TextButton(onPressed: () {
            Provider.of<ProductsProvider>(context, listen: false).remove(product);
            Navigator.pop(context);
          },
            child: Text('Sim'),),
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Não'),),
        ],
      );

      showDialog(context: context, builder: (context) => alert,);
    }

      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          tileColor: Colors.grey[100],
          leading: product.image.isEmpty
              ? CircleAvatar(
            backgroundColor: Color(product.color),
            backgroundImage: AssetImage(noImageDefault),)
              : CircleAvatar(
            backgroundColor: Color(product.color),
            backgroundImage: AssetImage(product.image),),
          title: Text(product.title),
          subtitle: Text('R\$ ${product.price}'),
          trailing: Container(
            width: 180,
            child: Row(
              children: [
                CartCounter(numOfItems: 1),
                IconButton(
                    icon: Icon(Icons.delete, color: Colors.red,),
                    onPressed: _alert)
              ],
            ),
          ),
        ),
      );
    }
}

