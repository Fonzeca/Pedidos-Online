import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:item_repository/item_repository.dart';
import 'package:pedidos_online_front/src/carta/bloc/items_bloc.dart';

import 'menu_view.dart';

class MenuPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider<ItemsBloc>(
        create: (context) {
          return ItemsBloc(RepositoryProvider.of<ItemRepository>(context))..add(ItemsRequested());
        },
        child: MenuView2(),
      ),
    );
  }

}