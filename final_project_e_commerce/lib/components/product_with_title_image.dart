import 'package:final_project_e_commerce/model/model.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class ProductWithTitleImage extends StatelessWidget {

  Product product;

  ProductWithTitleImage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tipo do produto",
            style: TextStyle(
              color: Color(product.color) == Color(0xFFFFEB3B) ? kTextColor : Colors.white,
            ),
          ),
          Text(
              product.title,
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Color(product.color) == Color(0xFFFFEB3B) ? kTextColor : Colors.white,
                  fontWeight: FontWeight.bold
              )
          ),
          SizedBox(height: kDefaultPadding,),
          Row(
            children: [
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: 'Preço\n', style: TextStyle(color: Color(product.color) == Color(0xFFFFEB3B) ? kTextColor : Colors.white,)),
                  TextSpan(text: 'R\$ ${product.price.toString()}',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Color(product.color) == Color(0xFFFFEB3B) ? kTextColor : Colors.white,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ],
              )
              ),
              SizedBox(width: kDefaultPadding,),
              Expanded(
                  child: Hero(
                    tag: "${product.id}",
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.fitWidth,
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}