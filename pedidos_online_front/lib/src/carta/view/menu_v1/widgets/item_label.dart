import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ItemLabel extends StatelessWidget {
  static String dots;

  final String name;
  final String price;
  final String description;
  final String image;
  final List<String> prices;
  final List<String> categories;

  const ItemLabel({Key key, this.name, this.price, this.description, this.image, this.categories, this.prices})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(categories != null){
      return _buildWithCategories();
    }
    else{
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
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 140
                      ),
                      child: FittedBox(
                        child: Text(
                          name,
                          textAlign: TextAlign.left,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        getDots(),
                        maxLines: 1,
                      )
                    ),
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
  }

  Widget _buildWithCategories(){
    List<Widget> widgets = List<Widget>();

    widgets.add(
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Opacity(
                opacity: 0.5,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 180
                  ),
                  child: Text(
                    description,
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );

    categories.asMap().forEach((index, value) {
      widgets.add(
          Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: 140
                ),
                child: FittedBox(
                  child: Text(
                    categories[index],
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Text(
                    getDots(),
                    maxLines: 1,
                  )
              ),
              Text("" + prices[index])
            ],
          )
      );
    });


    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: widgets,
      )
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
