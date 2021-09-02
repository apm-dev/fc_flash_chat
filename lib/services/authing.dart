import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authing {
  final String baseUrl;

  static String token = "";

  Authing({@required this.baseUrl});

  Future<bool> register(String name, uname, passwd) async {
    Map<String, String> data = {
      "name": name,
      "username": uname,
      "password": passwd,
    };

    http.Response response = await http.post(
      Uri.parse("http://$baseUrl/register"),
      body: json.encode(data),
    );

    if (response.statusCode ~/ 100 != 2) {
      print("failed to register user $name @$uname");
      return false;
    }

    print("user $uname registered");
    var resp = json.decode(response.body);
    print(resp);

    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("USERNAME", uname);
    sp.setString("PASSWORD", passwd);
    sp.setString("TOKEN", resp["content"]["token"]);
    return true;
  }
}
