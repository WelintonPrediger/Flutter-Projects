import 'package:flutter/material.dart';
import 'components.dart';

class CounterWithFavoriteButton extends StatelessWidget {
  const CounterWithFavoriteButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(numOfItems: 1,),
        Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF6464),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.favorite, color: Colors.white,),
              onPressed: (){
                /// Custom favorite button aplly it with BloC
              },
            )
        )
      ],
    );
  }
}