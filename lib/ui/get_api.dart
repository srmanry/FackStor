import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';

import '../api_model/user_model/user_page.dart';

class Get_api extends StatefulWidget {
  const Get_api({super.key});

  @override
  State<Get_api> createState() => _Get_apiState();
}

class _Get_apiState extends State<Get_api> {
  List get_api_data = ["User data", "Product data"];
  String readmoretext =
      "An application programming interface is a way for two or more computer programs to communicate with each other. "
      "It is a type of software interface, offering a service to other pieces of software. A document or standard that describes how to build or use such a connection or interface is called an API specification.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Card(
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Get API Introduction",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreText(
                        readmoretext,
                        trimLines: 3,
                        textAlign: TextAlign.justify,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: "Show More",
                        trimExpandedText: "Show Less",
                        lessStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                        moreStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                        style: TextStyle(fontSize: 16, height: 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.to(User_page());
                                },
                                icon: Icon(Icons.person)),
                            Text("User data")
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopify),
                            ),
                            Text("Shoping")
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.comment)),
                            Text("comments")
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 400,
            child: Text("User Data"),
          )
        ],
      ),
    );
  }
}
