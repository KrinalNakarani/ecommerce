import 'dart:convert';

import 'package:ecommerce/apiclass/ApiClass.dart';
import 'package:http/http.dart' as http;

class StoreApi {
  Future<List<dynamic>> getApiData() async {
    String apilink = "https://fakestoreapi.com/products";
    Uri uri = Uri.parse(apilink);
    var abc = await http.get(uri);
    var pqr = jsonDecode(abc.body);
    return pqr.map((e)=>StoreModel().storeModelFactory(e)).toList();
  }
}
