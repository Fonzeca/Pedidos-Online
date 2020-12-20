
import 'dart:convert';

import '../item_repository.dart';
import 'package:http/http.dart' as http;

import 'client/mindia_http_client.dart';


class ItemRepository{

  final client = MindiaHttpClient(http.Client());
  final String IpServer = "http://vps-1791261-x.dattaweb.com";
  final String Port = "4596";

  Future<List<Item>> getAllItems() async{
    String endpoint = "/item/list";

    var response = await client.get(IpServer + ":" + Port + endpoint);

    print("getAllItems/ Status: " + response.statusCode.toString() + " Body: " + response.body);

    if(response.statusCode != 200) throw new Exception ("No se pudo conectar.");

    var jsonData = json.decode(response.body);
    List<Item> items = [];
    for(var i in jsonData){
      Item item = Item.fromJson(i);
      items.add(item);
    }
    return items;
  }

  Future<List<Item>> getItemsBySection(String section) async{
    String endpoint = "items/listBySection";
    String params = "?section"+section;

    var response = await client.get(IpServer + ":" + Port + endpoint + params);

    print("getItemsBySection/ Status: " + response.statusCode.toString() + " Body: " + response.body);

    if(response.statusCode != 200){
      throw new Exception("No se pudo conectar.");
    }

    var jsonData = json.decode(response.body);
    List<Item> items = [];
    for(var i in jsonData){
      Item item = Item.fromJson(i);
      items.add(item);
    }
    return items;
  }

  Future<List<Section>> getAllSections() async{

    String endpoint = "/section/list";

    var response = await client.get(IpServer + ":" + Port + endpoint);

    print("getAllSections/ Status: " + response.statusCode.toString() + " Body: " + response.body);

    if(response.statusCode != 200) throw new Exception ("No se pudo conectar.");

    var jsonData = json.decode(response.body);
    List<Section> sections = [];
    for(var s in jsonData){
      Section section = Section.fromJson(s);
      sections.add(section);
    }
    return sections;
  }
}