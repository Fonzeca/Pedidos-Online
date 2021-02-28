import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedidos_online_front/src/carta/bloc/kart_bloc.dart';
import 'package:pedidos_online_front/src/carta/model/item_carta.dart';
import 'package:pedidos_online_front/src/carta/view/menu_v2/widgets/custom_labeled_radio.dart';
import 'package:pedidos_online_front/src/carta/view/menu_v2/widgets/kart_dialog.dart';
import 'package:responsive_scaffold/data/classes/details.dart';

import 'configuration.dart';

class DetailsView extends StatelessWidget{

  final List<String> sectionCategories;
  final ItemCarta item;
  final bool isTablet;



  DetailsView({this.sectionCategories, this.item, this.isTablet});

  @override
  Widget build(BuildContext context) {
    if(isTablet){
      return Container(
        color: backgroundColor,
        child: Center(
          child: Card(
              margin: EdgeInsets.all(12),
              child: buildContent(context)
          ),
        ),
      );
    }

    return Container(
      child: buildContent(context),
    );

  }

  Widget buildContent(BuildContext context){
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.name),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Opacity(
              opacity: 0.7,
              child: Text(item.description)
          ),
          SizedBox(height: 50,),
          buildRadioButtons() ?? SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => clickBuy(context, item),
                child: Text("Comprar"),
              ),
              ElevatedButton(
                onPressed: () => clickAddToKart(context, item),
                child: Text("Agregar al carrito"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildRadioButtons(){

    if(item.prices == null || item.prices.isEmpty){
      return null;
    }

    ValueNotifier<int> indexOfSelected = ValueNotifier<int>(0);

    List<Widget> radioButtons = item.prices.map((e) =>
        ValueListenableBuilder(
          valueListenable: indexOfSelected,
          builder: (context, value, child) => LabeledRadio(
            value: item.prices.indexOf(e),
            groupValue: indexOfSelected.value,
            onChanged: (value) {
              indexOfSelected.value = value;
            },
            padding: EdgeInsets.all(0),
            label: sectionCategories[item.prices.indexOf(e)],
            trailing: e,
          ),
        )
    ).toList();

    return Column(
      children: radioButtons,
    );
  }


  void clickAddToKart(BuildContext context, ItemCarta item){
    BlocProvider.of<KartBloc>(context).add(KartAdding(name: item.name, price: item.price, quantity: 1));
  }

  void clickBuy(BuildContext context, ItemCarta item){
    BlocProvider.of<KartBloc>(context).add(KartAdding(name: item.name, price: item.price, quantity: 1));
    showDialog(
      context: context,
      builder: (context) => DialogKart(),
    );
  }

}
