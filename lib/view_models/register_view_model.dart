import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwor2Controller = TextEditingController();

  Future register() async {
    var body = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    try {
      http.Response response = await http.post(Uri.parse("https://reqres.in/api/register"), body: json.encode(body));
      print(response.body);
      if (response.statusCode == 200) {
        print("başarılı");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
