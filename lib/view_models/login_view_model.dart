import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future login() async {
    var body = {
      "username": usernameController.text,
      "password": passwordController.text,
    };
    try {
      http.Response response = await http.post(Uri.parse("https://reqres.in/api/login"), body: json.encode(body));
      print(response.body);
      if (response.statusCode == 200) {
        print("başarılı");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
