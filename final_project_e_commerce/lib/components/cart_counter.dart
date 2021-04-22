import 'package:flutter/material.dart';
import '../constant.dart';

class CartCounter extends StatefulWidget {

  int numOfItems = 1;


  CartCounter({this.numOfItems});

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _rowButtonIncrementCounter(
            icon: Icon(Icons.remove),
            press: (){
              ///decrement counter with BloC
              if(widget.numOfItems > 1){
                setState(() {
                  widget.numOfItems--;
                });
              }
            }
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(
            widget.numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        _rowButtonIncrementCounter(
            icon: Icon(Icons.add),
            press: (){
              /// increment counter with BloC
              setState(() {
                widget.numOfItems++;
              });
            }
        ),
      ],
    );
  }

  _rowButtonIncrementCounter({Icon icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: kTextLightColor),
            borderRadius: BorderRadius.circular(10)
        ),
        child: TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero)
          ),
          onPressed: press,
          child: icon,
        ),
      ),
    );
  }
}