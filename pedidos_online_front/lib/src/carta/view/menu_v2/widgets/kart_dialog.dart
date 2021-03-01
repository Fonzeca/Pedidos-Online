import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pedidos_online_front/src/carta/bloc/kart_bloc.dart';
import 'package:pedidos_online_front/src/carta/model/item_kart.dart';
import 'package:url_launcher/url_launcher.dart';

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
    int total = 0;


    if(state.items == null || state.items.isEmpty){
      return Container(
        constraints: BoxConstraints(
            maxWidth: 360,
            maxHeight: 500
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Carrito", textAlign: TextAlign.center,),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Text("Vacio"),
          ],
        ),
      );
    }

    state.items.forEach((element) {total += (element.price * element.quantity);});

    return Container(
      constraints: BoxConstraints(
        maxWidth: 360,
        maxHeight: 500
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Carrito", textAlign: TextAlign.center,),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.items.length,
              itemBuilder: (context, index) => eachItemOnKart(state.items, index, context),
            ),
          ),
          Divider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Total: ",textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Expanded(
                  child: Text("\$$total", textAlign: TextAlign.right,)
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: () {
                    clickFinalBuy(context, state.items);
                  },
                  child: Row(
                    children: [
                      Text("Comprar "),
                      Icon(FontAwesome.whatsapp)
                    ],
                  )
                )
              ],
            ),
          )
        ],
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
            SizedBox(width: 10,),
            Text("\$" + (item.price * item.quantity).toString()),
            IconButton(
              splashRadius: 20,
              tooltip: "Remover solo 1 item del carrito",
              icon: Icon(Icons.remove),
              onPressed: () {
                clickMinus(context, item);
              },
            ),
            IconButton(
              splashRadius: 20,
              tooltip: "Remover toda la cantidad de items del carrito",
              icon: Icon(Icons.delete_forever_outlined),
              onPressed: () {
                clickDeleteAll(context, item);
              },
            )
          ],
        ),
      ),
      dense: true,
      subtitle: item.category != null ? Text(item.category) : null,
    );
  }

  void clickMinus(BuildContext context, ItemKart item){
    BlocProvider.of<KartBloc>(context).add(KartRemoving(name: item.name, category: item.category));
  }

  void clickDeleteAll(BuildContext context, ItemKart item){
    BlocProvider.of<KartBloc>(context).add(KartRemoving(name: item.name, category: item.category, isAll: true));
  }

  void clickFinalBuy(BuildContext context, List<ItemKart> list){
    int total = 0;
    list.forEach((element) {total += (element.price * element.quantity);});

    BlocProvider.of<KartBloc>(context).add(KartBuying(list: list, total: total));
  }

}