import 'package:final_project_e_commerce/model/model.dart';
import 'package:flutter/material.dart';
import 'components.dart';
import '../constant.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cores'),
              Row(
                children: [
                  ColorDot(color: Color(0xFF356C95), isSelected: true,),
                  ColorDot(color: Color(0xFFF8C078),),
                  ColorDot(color: Color(0xFFA29B9B),),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
              text: TextSpan(
                  style: TextStyle(color: kTextColor),
                  children: [
                    TextSpan(
                      text: 'Size\n',
                    ),
                    TextSpan(
                        text: '${product.size}',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold
                        )
                    )
                  ]
              )
          ),
        )
      ],
    );
  }
}