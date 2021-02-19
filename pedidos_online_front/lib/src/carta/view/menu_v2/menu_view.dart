
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

  String appBarTitleSection = appBarTitle;

  //---------------------------------------------
  // Esqueleto

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

  ///Esqueleto de la carta
  Widget _buildScaffold(){
    ResponsiveScaffold scaffold = ResponsiveScaffold(
      title: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) => buildTitle(),
      ),
      drawer: Drawer(
        child: buildDrawer()
      ),
      body: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          if(value == -1){
            return buildHome();
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

  //---------------------------------------------
  //Drawer

  Widget buildDrawer(){
    return ListView.builder(
      itemCount: sections.length + 1,
      itemBuilder: (context, index) {
        if(index == 0){
          return buildDrawerHeader();
        }
        return buildSectionsOnDrawer(context, index - 1);
      },
    );
  }

  Widget buildDrawerHeader(){
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

  Widget buildSectionsOnDrawer(BuildContext context, int index){
    return ListTile(
      title: Text(sections[index].name),
      onTap: () => clickSections(context, index),
    );
  }

  void clickSections(BuildContext context, int index){
    valueNotifier.value = index;
    appBarTitleSection = sections[index].name;
    if(MediaQuery.of(context).size.width < kDesktopBreakpoint){
      Navigator.of(context).pop();
    }
  }

  //---------------------------------------------
  //Bar and home

  Widget buildTitle(){
    return Text(appBarTitleSection);
  }

  Widget buildHome(){
    return Container(
      child: Center(
        child: Text("Home"),
      ),
    );
  }

  //---------------------------------------------
  //Menu y details

  Widget _menu(int indexSection){
    return ResponsiveListScaffold.builder(
      itemCount: sections[indexSection].items.length,
      tabletFlexDetailView: 3,
      detailBuilder: (context, index, tablet) => buildDetailsScreenOnItemSelected(context, index, tablet, indexSection),
      tabletItemNotSelected: Container(
          color: Colors.green
      ),
      itemBuilder: (context, index) => buildItemsOnSection(context, index, indexSection),
    );
  }

  Widget buildItemsOnSection(BuildContext context, int index, int indexSection){
    ItemCarta item = sections[indexSection].items[index];
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
  }

  DetailsScreen buildDetailsScreenOnItemSelected(BuildContext context, int index, bool tablet, int indexSection){
    ItemCarta item = sections[indexSection].items[index];

    return DetailsScreen(
      appBar: tablet ? null : AppBar(),
      body: Container(
        child: Center(
          child: Text(item.name),
        ),
      ),
    );
  }

}