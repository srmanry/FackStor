import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../user_model.dart';

class User_page extends StatefulWidget {
  const User_page({super.key});

  @override
  State<User_page> createState() => _User_pageState();
}

class _User_pageState extends State<User_page> {
  Future<List<UserModel>> Get_workers() async {
    final Worker_url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final reponse_Workers = await http.get(Worker_url);
    // print(reponse_Workers.body);
    // print(reponse_Workers.statusCode);

    var resBody = jsonDecode(reponse_Workers.body);
    List<UserModel> user_list = [];
    for (var data in resBody) {
      user_list.add(UserModel.fromJson(data));
    }
    print(user_list[0].email);
    return user_list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get _user"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.green)),
                      hintText: "খুজুন ",
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 550,
              child: FutureBuilder<List<UserModel>>(
                future: Get_workers(),
                builder: (BuildContext context, AsyncSnapshot shanpshort) {
                  if (shanpshort.hasError) {
                    return Center(child: Text(" has error"));
                  } else if (shanpshort.hasData) {
                    // return Center(
                    //   child: Text(
                    //     "Hade data",
                    //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    //   ),
                    // );

                    List<UserModel> user_list = shanpshort.data;
                    return ListView.builder(
                      itemCount: user_list.length,
                      itemBuilder: (_, index) {
                        print(user_list[index].name!);
                        return Card(
                          //elevation: 10,
                          child: ListTile(
                            title: Text(
                              user_list[index].name!,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              user_list[index].address!.city!,
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
