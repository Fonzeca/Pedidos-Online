import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:item_repository/item_repository.dart';
import 'package:pedidos_online_front/src/carta/bloc/items_bloc.dart';

import 'menu_view.dart';

class MenuPage1 extends StatelessWidget {
  const MenuPage1({Key key}) : super(key: key);

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
      body: MenuView1(),
    );
  }
}
