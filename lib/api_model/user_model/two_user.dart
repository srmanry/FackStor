import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

import '../user_model.dart';

class User_two extends StatefulWidget {
  const User_two({super.key});

  @override
  State<User_two> createState() => _User_twoState();
}

class _User_twoState extends State<User_two> {
  Future<List<UserModel>> tow_user() async {
    final api_url = Uri.parse("https://jsonplaceholder.typicode.com/users");

    var api_body = await http.get(api_url);
    // print(api_body.statusCode == 200);
    print(api_body.statusCode);
    print(api_body.body);

    return jsonDecode(api_body.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
