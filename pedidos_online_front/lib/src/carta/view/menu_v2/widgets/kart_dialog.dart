import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedidos_online_front/src/carta/bloc/kart_bloc.dart';
import 'package:pedidos_online_front/src/carta/model/item_kart.dart';

class DialogKart extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<KartBloc, KartState>(
        builder: (context, state) {

          return Container(
            padding: EdgeInsets.all(12),
            child: buildContent(context, state),
          );
        },
      ),
    );
  }

  Widget buildContent(BuildContext context, KartState state){

    if(state.items == null || state.items.isEmpty){
      return Text("Vacio");
    }
    return Container(
      constraints: BoxConstraints(
        maxWidth: 360,
        maxHeight: 500
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.items.length,
        itemBuilder: (context, index) => eachItemOnKart(state.items, index, context),
      ),
    );
  }

  Widget eachItemOnKart(List<ItemKart> list, int index, BuildContext context){
    ItemKart item = list[index];

    return ListTile(
      title: Text("" + item.name),
      trailing: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("x" + item.quantity.toString()),
            IconButton(
              splashRadius: 20,
              tooltip: "Remover solo 1 item del carrito",
              icon: Icon(Icons.remove),
              onPressed: () {
                clickMinus(context, item.name);
              },
            ),
            IconButton(
              splashRadius: 20,
              tooltip: "Remover toda la cantidad de items del carrito",
              icon: Icon(Icons.delete_forever_outlined),
              onPressed: () {
                clickDeleteAll(context, item.name);
              },
            )
          ],
        ),
      ),
      dense: true,
    );
  }

  void clickMinus(BuildContext context, String itemName){
    BlocProvider.of<KartBloc>(context).add(KartRemoving(name: itemName));
  }

  void clickDeleteAll(BuildContext context, String itemName){
    BlocProvider.of<KartBloc>(context).add(KartRemoving(name: itemName, isAll: true));
  }

}