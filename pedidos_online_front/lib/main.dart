import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedidos_online_front/item_observer.dart';
import 'package:pedidos_online_front/src/carta/view/menu_view.dart';

void main() {
  Bloc.observer = ItemObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Raleway'),
        title: 'Pedidos Online',
        initialRoute: 'basico',
        routes: {
          'basico': (BuildContext context) => MenuView(),
        });
  }
}
