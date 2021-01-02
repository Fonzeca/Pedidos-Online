import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedidos_online_front/src/carta/view/pagina_basico.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [ItemCubit] instance to the [ItemView].
/// {@endtemplate}
class ItemPage extends StatelessWidget {
  /// {@macro counter_page}
  const ItemPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => ItemCubit(), child: ItemView());
  }
}
