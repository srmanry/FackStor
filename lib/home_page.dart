import 'package:api_pjt/api_model/product_model/product_page.dart';
import 'package:api_pjt/pages/api_details/api_introduce.dart';
import 'package:api_pjt/ui/api_introduction.dart';
import 'package:api_pjt/ui/delete_api.dart';
import 'package:api_pjt/ui/get_api.dart';
import 'package:api_pjt/ui/post_api.dart';
import 'package:api_pjt/ui/state_manage.dart';
import 'package:api_pjt/ui/update_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';

import 'api_model/user_model/two_user.dart';
import 'api_model/user_model/user_page.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  List get_api_data = [
    "API Introduction",
    "Get API",
    "Post API",
    "Update API",
    "Delete API",
  ];
  //List color_list = [Color(0xFFFFF)];
  List route_page = [
    Api_introduction(),
    Get_api(),
    Post_page(),
    Update_page(),
    Delete_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text(
            "Fack Store",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                //color: Colors.blue[100],
                height: 250,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/api.png",
                        //width: double.infinity,
                        // height: 300,
                        // fit: BoxFit.cover,
                      ),
                      Text(
                        "API = Application Program Interface",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextButton(
                                onPressed: () {
                                  Get.to(Api_Introduce());
                                },
                                child: Text(
                                  "Read more",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextButton(
                                onPressed: () {
                                  Get.to(Statemange_ment());
                                },
                                child: Text(
                                  "State manage",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
                height: 400,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.to(User_page());
                            },
                            child: Text(
                              "Get Api Data",
                              style: TextStyle(fontSize: 18),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.to(User_two());
                            },
                            child: Text(
                              "User",
                              style: TextStyle(fontSize: 18),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.to(Product_page());
                            },
                            child: Text(
                              "Product",
                              style: TextStyle(fontSize: 18),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const User_page()),
                              );
                            },
                            child: Text(
                              "Comment",
                              style: TextStyle(fontSize: 18),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )),
          ],
        ));
  }
}

//......................................................................................Costom widgets

api_text() {
  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "API = Application Program Interface",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.green),
        ),
      ),
    ],
  );
}


/*

  SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: get_api_data.length,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 40,
                      //  color: Colors.green,
                      //color: color_list[index],
                      child: Card(
                        color: Colors.green,
                        child: Center(
                            child: InkWell(
                                onTap: () {
                                  Get.to(route_page[index]);
                                },
                                child: Text(get_api_data[index]))),
                      ),
                    );
                  }),
            ),
 */