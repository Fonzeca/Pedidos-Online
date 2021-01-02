import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:item_repository/item_repository.dart';
import 'package:pedidos_online_front/src/carta/bloc/items_bloc.dart';
import 'package:pedidos_online_front/src/carta/view/menu_view.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [ItemCubit] instance to the [ItemView].
/// {@endtemplate}
class ItemPage extends StatelessWidget {
  /// {@macro counter_page}
  const ItemPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos Online'),
        backgroundColor: Color(0xFF30475E),
      ),
      backgroundColor: Color(0xFFe8e8e8),
      body: BlocProvider(
        create: (context) {
          return ItemsBloc(RepositoryProvider.of<ItemRepository>(context));
        },
        child: MenuView(),
      ),
    );
  }
}
