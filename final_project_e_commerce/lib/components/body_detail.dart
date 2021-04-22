import 'package:final_project_e_commerce/constant.dart';
import 'package:flutter/material.dart';
import 'package:final_project_e_commerce/model/model.dart';
import 'components.dart';

class BodyDetail extends StatelessWidget {

  Product product;

  BodyDetail({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPadding,
                      right: kDefaultPadding
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)
                    )
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPadding / 2,),
                      Description(product: product),
                      CounterWithFavoriteButton(),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductWithTitleImage(product: product,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}