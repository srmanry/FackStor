import 'dart:convert';

import 'package:api_pjt/api_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Product_page extends StatefulWidget {
  const Product_page({super.key});

  @override
  State<Product_page> createState() => _Product_pageState();
}

class _Product_pageState extends State<Product_page> {
  Future<List<Product_model>> Get_product() async {
    final Poduct_url = Uri.parse("https://fakestoreapi.com/products");
    final Product_response = await http.get(Poduct_url);
    var Product_body = jsonDecode(Product_response.body);
    List<Product_model> Product_list = [];
    for (var data in Product_body) {
      Product_list.add(Product_model.fromJson(data));
    }
    print(Product_list[0].title);
    return Product_list;
  }
/*
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

 */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Product View"),
      ),
      body: FutureBuilder<List<Product_model>>(
        future: Get_product(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Not found data"));
          } else if (snapshot.hasData) {
            List<Product_model> Product_list = snapshot.data;
            return GridView.builder(
                itemCount: Product_list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                          height: 150,
                          width: 100,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {}, child: Text("Detiles")),
                                  Center(
                                      child: Expanded(
                                    child: Container(
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: BorderRadius.only(
                                              // topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20))),
                                      child: Center(
                                        child: Text("21558"),
                                        // child: Padding(
                                        //   padding:
                                        //       const EdgeInsets.only(right: 0.0),
                                        //   child: Text(Product_list[index]
                                        //       .price!
                                        //       .toString()),
                                        //   //child: Text("Price:250"),
                                        // ),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                              Container(
                                height: 98,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    Product_list[index].image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                Product_list[index].category!,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                          // child: Column(
                          //   children: [

                          //     // Row(
                          //     //   mainAxisAlignment: MainAxisAlignment.end,
                          //     //   children: [
                          //     //     Text(
                          //     //       "Price:${Product_list[index].price.toString()}",
                          //     //       style: TextStyle(
                          //     //           fontSize: 14, fontWeight: FontWeight.bold),
                          //     //     ),
                          //     //   ],
                          //     // ),
                          //   ],
                          // ),
                          ),
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
