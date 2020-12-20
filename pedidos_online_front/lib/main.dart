import 'package:flutter/material.dart';
import 'file:///C:/Users/Alexis%20Fonzo/Desktop/Mindia/Software/PedidosOnline/Pedidos%20Online/pedidos_online_front/lib/src/carta/view/pagina_basico.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'basico',
      routes:{
        'basico': (BuildContext context )=> basico(),
      }
    );
  }
}
