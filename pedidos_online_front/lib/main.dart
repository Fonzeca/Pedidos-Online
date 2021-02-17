import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:item_repository/item_repository.dart';
import 'package:pedidos_online_front/src/carta/bloc/items_bloc.dart';
import 'package:pedidos_online_front/src/carta/view/menu_v1/menu_page.dart';
import 'package:pedidos_online_front/src/carta/view/menu_v2/menu_page.dart';


void main() {
  runApp(MyApp(
    itemRepository: ItemRepository(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({@required this.itemRepository}) : assert(itemRepository != null);

  final ItemRepository itemRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: itemRepository,
      child: BlocProvider(
        create: (context) => ItemsBloc(itemRepository),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Raleway'),
            title: 'Pedidos Online',
            initialRoute: 'menu2',
            builder: EasyLoading.init(),
            routes: {
              'menu1': (BuildContext context) => MenuPage1(),
              'menu2': (BuildContext context) => MenuPage2(),
            }),
      ),
    );
  }
}
