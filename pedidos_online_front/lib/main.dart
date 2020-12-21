import 'package:flutter/material.dart';
import 'package:pedidos_online_front/src/carta/view/pagina_basico.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Raleway'),
        title: 'Pedidos Online',
        initialRoute: 'basico',
        routes: {
          'basico': (BuildContext context) => basico(),
        });
  }
}
