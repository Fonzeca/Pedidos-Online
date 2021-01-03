import 'package:flutter/material.dart';

class TituloSection extends StatelessWidget {
  static String linea = " ___ ";
  final String titulo;
  final double styleT = 20.0;
  final String descripcion;

  const TituloSection({Key key, this.titulo, this.descripcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 60.0,
      child: Column(
        children: [
          Text(
            linea + titulo + linea,
            style: TextStyle(fontSize: styleT, color: Color(0xFF222831)),
          ),
          Text(descripcion != null ? descripcion : ""),
        ],
      ),
    );
  }
}
