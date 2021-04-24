import 'dart:convert';
import 'package:book_shop/api.dart';
import 'package:book_shop/models/sizas_center_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class API_Manager {
  Future<SizasCenter> getSIzasCenterMember(String id) async {
    var client = http.Client();
    var sizas_center_member;
    String url = Api.sizas_center_url + id;
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        print("member api call success........");
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        sizas_center_member = SizasCenter.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception);
      return sizas_center_member;
    }

    return sizas_center_member;
  }
}
