import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/environment.dart';
import '../models/cat_model.dart';


class CatProvider extends ChangeNotifier {
  List<CatFact>_loadedResults = [];
  List<CatFact> get loadedResults => _loadedResults;

  Future<http.Response> loadCatApi() async {
    String url = Environment.CAT_API_URL;

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    final uri = Uri.parse(url);

    http.Response response = await http.get(uri, headers: headers);

    Map<String, dynamic> jsonMap = json.decode(response.body);

    List<CatFact> catFactResponse = CatModelResponse.fromJson(jsonMap).data;


    _loadedResults = catFactResponse;
    notifyListeners();

    return response;
  }
}
