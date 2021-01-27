
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pedidos_online_front/src/carta/bloc/items_bloc.dart';
import 'package:pedidos_online_front/src/carta/model/section_carta.dart';
import 'package:pedidos_online_front/src/carta/view/menu_v1/title_section.dart';
import 'package:pedidos_online_front/src/carta/view/menu_v1/title_section_categories.dart';

// ignore: camel_case_types
class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemsBloc, ItemsState>(
      listener: (context, state) {
        print(state.status);
        switch (state.status) {
          case ItemsObtainedStatus.loading:
          case ItemsObtainedStatus.none:
            //Aparece el loading
            EasyLoading.show(status: 'cargando...');
            break;
          case ItemsObtainedStatus.success:
            //Desaparece el loading
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            EasyLoading.showSuccess("Success!");
            break;
          case ItemsObtainedStatus.failure:
            //Toast fail
            EasyLoading.showError("Failure!");
            break;
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: BlocBuilder<ItemsBloc, ItemsState>(
          builder: (context, state) {
            switch (state.status) {
              case ItemsObtainedStatus.loading:
              case ItemsObtainedStatus.none:
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Icon(Icons.auto_awesome,size: 48),
              );
                break;
              case ItemsObtainedStatus.success:
                int itemsPerRow = 4;
                double sizeWidth = MediaQuery.of(context).size.width;
                if(sizeWidth < 1100){
                  itemsPerRow = 3;
                }
                if(sizeWidth < 800){
                  itemsPerRow = 2;
                }

                if(sizeWidth < 600){
                  itemsPerRow = 1;
                }

                return SingleChildScrollView(
                  child: _buidlMenu(state.sections, itemsPerRow)
                );
                break;
              case ItemsObtainedStatus.failure:
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Icon(Icons.sentiment_very_dissatisfied,size: 48),
                );
                break;
              default:
                return Container();
                break;
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buidlMenu(List<SectionCarta> sections, int itemsPerRow){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: sections.map((e) => _buildSection(e, itemsPerRow)).toList()
      ),
    );
  }

  Widget _buildSection(SectionCarta section, int itemsPerRow){
    if(section.type == 1){
      return TituloSectionCategories(
        titulo: section.name,
        itemsPerRow: itemsPerRow,
        itemsCarta: section.items,
        categories: section.categories,
      );
    }else{
      Widget wdg_section = TituloSection(
        titulo: section.name,
        itemsCarta: section.items,
        itemsPerRow: itemsPerRow,
      );
      return wdg_section;
    }


  }
}
