
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pedidos_online_front/src/carta/bloc/items_bloc.dart';
import 'package:pedidos_online_front/src/carta/model/item_carta.dart';
import 'package:pedidos_online_front/src/carta/model/section_carta.dart';
import 'package:responsive_scaffold/templates/layout/scaffold.dart';
import 'package:responsive_scaffold/templates/list/responsive_list.dart';

import 'configuration.dart';

class MenuView2 extends StatelessWidget{

  List<SectionCarta> sections;
  ValueNotifier<int> valueNotifier = ValueNotifier<int>(-1);

  double kDesktopBreakpoint;
  int listItemsIndex;


  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemsBloc, ItemsState>(
      listener: (context, state) {
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
            switch(state.status){
              case ItemsObtainedStatus.loading:
              case ItemsObtainedStatus.none:
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Icon(Icons.auto_awesome,size: 48),
                );
                break;
              case ItemsObtainedStatus.success:
                sections = state.sections;
                return _buildScaffold();
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
          },
        ),
      ),
    );
  }

  Widget _buildScaffold(){
    ResponsiveScaffold scaffold = ResponsiveScaffold(
      title: Text("asd"),
      drawer: Drawer(
        child: _buildDrawer()
      ),
      body: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          if(value == -1){
            return Container(
              child: Center(
                child: Text("Home"),
              ),
            );
          }
          return Container(
            child: _menu(value)
          );
        },
      ),
    );

    kDesktopBreakpoint = scaffold.kDesktopBreakpoint;
    return scaffold;
  }

  Widget _buildDrawer(){
    return ListView.builder(
      itemCount: sections.length + 1,
      itemBuilder: (context, index) {
        if(index == 0){
          return DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: ExactAssetImage(
                    uriImageDrawer
                ),
                fit: BoxFit.none
              )
            ),
          );
        }
        return ListTile(
          title: Text(sections[index-1].name),
          onTap: () {
            valueNotifier.value = index-1;
            listItemsIndex = -1;
            if(MediaQuery.of(context).size.width < kDesktopBreakpoint){
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  Widget _menu(int indexSection){
    List<ItemCarta> items = sections[indexSection].items;

    print(listItemsIndex);

    return ResponsiveListScaffold.builder(
      itemCount: items.length,
      tabletFlexDetailView: 3,
      index: listItemsIndex,
      detailBuilder: (context, index, tablet) {
        return DetailsScreen(
          appBar: tablet ? null : AppBar(),
          body: Container(
            child: Center(
              child: Text(items[index].name),
            ),
          ),
        );
      },
      tabletItemNotSelected: Container(
        color: Colors.green
      ),
      itemBuilder: (context, index) {
        ItemCarta item = items[index];
        return Card(
          margin: EdgeInsets.all(7),
          child: Builder(
            builder: (context) {

              Widget title = Container(
                  child: AutoSizeText(item.name,)
              );

              Widget trailing = Container(
                child: Opacity(
                    opacity: 0.7,
                    child: AutoSizeText(item.description)
                ),
              );

              Widget leading = null;

              if(item.image != null && item.image != ''){
                leading = Image(
                  image: AssetImage(item.image),
                );
              }

              return ListTile(
                title: title,
                leading: leading,
                subtitle: trailing,
                isThreeLine: true,
              );
            },
          ),
        );
      },
    );


    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {

        ItemCarta item = items[index];
        return Card(
          margin: EdgeInsets.all(7),
          child: Builder(
            builder: (context) {
              
              Widget title = Container(
                child: AutoSizeText(item.name,)
              );

              Widget trailing = Container(
                child: Opacity(
                    opacity: 0.7,
                    child: AutoSizeText(item.description)
                ),
              );

              Widget leading = null;

              if(item.image != null && item.image != ''){
                leading = Image(
                  image: AssetImage(item.image),
                );
              }

              return ListTile(
                title: title,
                leading: leading,
                subtitle: trailing,
                isThreeLine: true,
              );
            },
          ),
        );
      },
    );
  }

}