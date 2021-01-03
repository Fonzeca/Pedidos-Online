import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ItemLabel extends StatelessWidget {
  static String dots;

  final String name;
  final String price;
  final String description;
  final String image;

  const ItemLabel({Key key, this.name, this.price, this.description, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Builder(
                    builder: (context) {
                      if(image != null && image.isNotEmpty){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                  Text(name),
                  Expanded(
                      child: Text(
                    getDots(),
                    maxLines: 1,
                  )),
                  Text("" + price)
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Opacity(opacity: 0.5, child: Text(description)))
            ],
          )),
    );
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
