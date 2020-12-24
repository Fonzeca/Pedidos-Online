import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ItemLabel extends StatelessWidget {
  static String dots;

  final String name;
  final String price;
  final String description;

  const ItemLabel({Key key, this.name, this.price, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1,
        width: 10,
        child: Column(
          children: [
            Row(
              children: [
                Text(name),
                Expanded(
                    child: Text(
                  getDots(),
                  maxLines: 1,
                )),
                Text("\$" + price)
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 7),
                child: Opacity(opacity: 0.5, child: Text(description)))
          ],
        ));
  }

  static String getDots() {
    if (dots == null || dots.isEmpty) {
      dots = "";
      for (var i = 0; i < 10000; i++) {
        dots += ". ";
      }
    }
    return dots;
  }
}
