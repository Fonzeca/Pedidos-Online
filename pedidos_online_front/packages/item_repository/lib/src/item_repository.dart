
import 'dart:convert';

import '../item_repository.dart';
import 'package:http/http.dart' as http;


class ServidorRest{

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

    var n = json.decode(response.body);
    List<Item> items = [];
    for(var i in jsonData){
      Item item = Item.fromJson(i);
      items.add(item);
    }
    return items;
  }

}