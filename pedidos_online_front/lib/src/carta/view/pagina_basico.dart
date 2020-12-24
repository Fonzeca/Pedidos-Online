import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedidos_online_front/src/carta/view/item_label.dart';
import 'package:pedidos_online_front/src/carta/view/title_section.dart';

// ignore: camel_case_types
class basico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFe8e8e8),
        appBar: AppBar(
          title: Text('Pedidos Online'),
          backgroundColor: Color(0xFF30475E),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(children: [
            TituloSection(
              titulo: "Jugos y bebidas",
              descripcion: "Mas frias que el corazon de tu ex",
            ),
            //El GridView si esta dentro de una columna debe si o si estar en un expanded
            Expanded(child: _crearGridView()),
          ]),
        ));
  }
}

// Creo el GridView para retornar en el Scaffold

Widget _crearGridView() {
  return Container(
      width: 800,
      height: 500,
      color: Colors.black26,
      child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          mainAxisSpacing: 0.1,
          childAspectRatio: 3 / 2,
          padding: const EdgeInsets.all(15),
          crossAxisSpacing: 10,
          shrinkWrap: true,
          children: [
            //aqui se pone la lista para mostrar en el gridiview
            ItemLabel(
              description: "suave y espumoso",
              name: "Vino Fino",
              price: "45",
            ),
            ItemLabel(
              description: "suave y espumoso",
              name: "Vino Fino",
              price: "45",
            ),
            ItemLabel(
              description: "suave y espumoso",
              name: "Vino Fino",
              price: "45",
            ),
            ItemLabel(
              description: "suave y espumoso",
              name: "Vino Fino",
              price: "45",
            ),
            ItemLabel(
              description: "suave y espumoso",
              name: "Vino Fino",
              price: "45",
            ),
          ])
      //
      );
}
