import 'package:flutter/material.dart';
import 'package:final_project_e_commerce/model/model.dart';
import '../constant.dart';

class ItemCard extends StatelessWidget {

  final Product product;
  final Function press;
  const ItemCard({Key key, this.product, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              /// pega o index de um array de cores para cada produto que retornar do banco
              decoration: BoxDecoration(
                color: Color(product.color),
                borderRadius: BorderRadius.circular(16),
              ),
              ///pegando imagem do produto salva no banco
              child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image, fit: BoxFit.cover,)
              ),
            ),
          ),
          /// nome do produto quem vem do banco
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              product.title,
              style: TextStyle(
                  color: kTextLightColor
              ),
            ),
          ),
          ///valor do produto vem do banco
          Text(
            'R\$ ${product.price}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextColor
            ),
          )
        ],
      ),
    );
  }
}
