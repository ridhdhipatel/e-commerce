import 'dart:convert';

import 'package:demo_app/api_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'drinks.dart';

class DrinksProvider extends ChangeNotifier {
  List<Drinks> drinks = [];

  Future<APIResponse<List<Drinks>>> getDrinks() async {
    return http
        .get(Uri.parse(
            'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum'))
        .then((response) {
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body)['drinks'];
        List<Drinks> itemData = [];
        for (var item in responseData) {
          itemData.add(Drinks.fromJson(item));
        }
        drinks.addAll(itemData);
        notifyListeners();
        return APIResponse(data: drinks);
      } else {
        return APIResponse(isError: true, errorMessage: '');
      }
    });
  }

  Drinks getDrinkById(String drinkId) {
    var drink = drinks.firstWhere((drink) => drink.idDrink == drinkId);
    return drink;
  }
}
