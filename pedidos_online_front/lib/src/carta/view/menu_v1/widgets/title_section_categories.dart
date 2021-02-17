import 'package:flutter/material.dart';
import 'package:pedidos_online_front/src/carta/model/item_carta.dart';

import 'item_label.dart';


class TituloSectionCategories extends StatelessWidget {
  static String linea = " ___ ";
  final String titulo;
  final double styleT = 20.0;
  final String descripcion;
  final int itemsPerRow;
  final List<ItemCarta> itemsCarta;
  final List<String> categories;
  final PageController pageController = PageController();

  TituloSectionCategories({Key key, @required this.titulo, this.descripcion, @required this.itemsCarta, this.itemsPerRow = 4, this.categories})
      : assert(itemsCarta != null),
        assert(titulo != null),
        assert(itemsPerRow >= 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            linea + titulo + linea,
            style: TextStyle(fontSize: styleT, color: Color(0xFF222831)),
          ),
          Text(descripcion != null ? descripcion : ""),
          _buildMultipleCategories(),
        ],
      ),
    );
  }

  Widget _buildItems(int categorie) {
    //TODO: MEJORAR ESTO, QUE SE PIERDEN ALGUNOS

    ///Inicializalizamos las listas
    List<Row> rows = List(); /// Lista de rows
    List<Widget> bubbleItems = List(); /// Lista que contiene los widgets de cada row

    ///Recorremos cada item de la lista de items.
    itemsCarta.asMap().forEach((index, value) {

      ///Aca, por cada item de la lista, le agregamos al bubbleItems
      bubbleItems.add(
          Expanded(
            child: ItemLabel(
              description: value.description,
              name: value.name,
              image: value.image,
              prices: value.prices,
              categories: categories,
            ),
          )
      );



      ///Preguntamos si él item es el ultimo de la fila
      ///O si el item es el ultimo de la lista
      if((index + 1) % itemsPerRow == 0 || index == itemsCarta.length-1){

        ///Preguntamos si la cantidad el bubbleItems es menor a la cantidad de items por fila.
        ///Si es asi, la rellenamos, asi queda con el mismo tamaño que las otras
        while(bubbleItems.length < itemsPerRow){
          bubbleItems.add(Expanded(child: Container(),));
        }

        ///Agregamos una Row, con los items de bubbleItems
        rows.add(Row(children: bubbleItems,));
        ///Ponemos bubbleItems en vacio.
        bubbleItems = List();
      }




    });

    ///Retornamos una columna, que tiene la lista de Row
    return Column(
      children: rows,
    );
  }

  Widget _buildMultipleCategories(){
    return _buildItems(0);
  }
}
