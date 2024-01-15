import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/environment.dart';
import '../models/cat_fact.dart';

class CatProvider extends ChangeNotifier {
  late CatFactResponse _loadedResults;
  CatFactResponse get loadedResults => _loadedResults;

  Future<http.Response> loadCatApi() async {
    String url = Environment.CAT_API_URL;

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };


    final uri = Uri.parse(url);

    http.Response response = await http.get(uri, headers: headers);

    print("TADY ${response.body}");
    Map<String, dynamic> jsonMap = json.decode(response.body);

    CatFactResponse catFactResponse = CatFactResponse.fromJson(jsonMap);


    print(catFactResponse);
    print(catFactResponse.data[0].fact);



    _loadedResults = catFactResponse;
    notifyListeners();
    print(response.statusCode);

    return response;
  }
}
