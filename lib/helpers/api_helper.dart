import 'dart:convert';

import 'package:dogs_lucas/models/dogs.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

class api_helper {

  static Future<List<Dogs>> getAllDogs() async {
    var url = Uri.parse(Constants.apiAllURL);
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result;
      return list.map((model) => Dogs.fromJson(model)).toList();
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  // Future<String> getImageUrlByBreedId(String id) async {
  //   final response = await http.get(
  //       Uri.parse('https://api.thecatapi.com/v1/images/search?breed_ids=$id'));

  //   if (response.statusCode == 200) {
  //     final result = json.decode(response.body);
  //     Iterable list = result;
  //     return list.map((model) => CatImage.fromJson(model)).toList()[0].url;
  //   } else {
  //     throw Exception('Failed to load data!');
  //   }
  // }
}