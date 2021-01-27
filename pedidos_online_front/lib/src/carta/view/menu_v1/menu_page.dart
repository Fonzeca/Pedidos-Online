import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:item_repository/item_repository.dart';
import 'package:pedidos_online_front/src/carta/bloc/items_bloc.dart';
import 'file:///C:/Users/Alexis%20Fonzo/Desktop/Mindia/Software/PedidosOnline/Pedidos%20Online/pedidos_online_front/lib/src/carta/view/menu_v1/menu_view.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos Online'),
        backgroundColor: Color(0xFF30475E),
        centerTitle: true,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/burger.jpeg"),
            )
          ),
        ),
        leadingWidth: 100,
      ),
      backgroundColor: Color(0xFFe8e8e8),
      body: BlocProvider<ItemsBloc>(
        ///Creamos el Bloc, y tambien le disparamos un event
        create: (context) {
          return ItemsBloc(RepositoryProvider.of<ItemRepository>(context))..add(ItemsRequested());
        },
        child: MenuView(),
      ),
    );
  }
}