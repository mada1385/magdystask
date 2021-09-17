import 'package:flutter/material.dart';
import 'package:task/logic/Product.dart';
import 'package:task/components/colors.dart';
import 'package:task/components/styles.dart';

class Fooditem extends StatelessWidget {
  final Product food;
  final bool isProductPage, isliked;
  final int index, type;
  final double imgWidth;
  final Function onLike, onTapped;
  // final Provider provider;

  Fooditem(this.food,
      {Key key,
      // this.provider,
      this.isliked,
      this.index,
      this.type,
      this.isProductPage = false,
      this.imgWidth,
      this.onLike,
      this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      // color: Colors.red,
      margin: EdgeInsets.only(left: 20),
      child: Stack(
        children: <Widget>[
          Container(
              width: 180,
              height: 180,
              child: RaisedButton(
                  color: white,
                  elevation: (isProductPage) ? 20 : 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: onTapped,
                  child: Hero(
                      transitionOnUserGestures: true,
                      tag: food.name,
                      child: Image.asset(food.image,
                          width: (imgWidth != null) ? imgWidth : 100)))),
          Positioned(
            bottom: 0,
            left: 0,
            child: (!isProductPage)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(food.name, style: foodNameText),
                      Text(food.price, style: priceText),
                    ],
                  )
                : Text(' '),
          ),
        ],
      ),
    );
  }
}
