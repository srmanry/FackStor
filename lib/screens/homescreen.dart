import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List catagoryrlistimages = [
    "assets/catagory/kids.png",
    "assets/catagory/female.jpg",
    "assets/catagory/boy.png",
    "assets/catagory/kids.png",
    "assets/catagory/female.jpg",
    "assets/catagory/boy.png",
  ];
  List catagorytitle = [
    "kids",
    "Female",
    "Male",
    "kids",
    "Female",
    "Male",
  ];
  Future Getproduct() async {
    final proucturl = Uri.parse("https://fakestoreapi.com/products");
    final prouctrisponse = await http.get(proucturl);
    print(prouctrisponse.body);
    print(prouctrisponse.statusCode);
    return jsonDecode(prouctrisponse.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.notifications,
                color: Colors.red,
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Fack Store",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
        body: FutureBuilder(
          future: Getproduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: CarouselSlider(
                        items: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green[200],
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red[200],
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 100,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          // onPageChanged: ,
                          scrollDirection: Axis.horizontal,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Catagorys',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      )
                    ],
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: catagoryrlistimages.length,
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange[100],
                                      borderRadius: BorderRadius.circular(15)),
                                  height: 55,
                                  width: 60,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          catagoryrlistimages[index],
                                          height: 60,
                                          //width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                              ),
                              Text(
                                catagorytitle[index],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        }),
                  ),
                  Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 2 / 3),
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  // height: 200,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFFFFEFE9),
                                        // offset: const Offset(
                                        //   1.0,
                                        //   1.0,
                                        // ),
                                        blurRadius: 1.0,
                                        // spreadRadius: 1.0,
                                      ), //BoxShadow
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFFE4EDF4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "৳ : ${snapshot.data[index]["price"]}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFFFFFFFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                height: 150,
                                                width: 150,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  //clipBehavior: Clip.none,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.network(
                                                      snapshot.data[index]
                                                          ["image"],
                                                      fit: BoxFit.fitHeight,
                                                      height: 140,
                                                      width: 150,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "View",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .add_shopping_cart_rounded,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    "BUY",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Expanded(
                                            child: Text(
                                          snapshot.data[index]["title"],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))
                                      ],
                                    ),
                                  )),
                            );
                          }))
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}


/*
Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  height: 200,
                                  child: ListView.builder(
                                      itemCount: 20,
                                      itemBuilder: (_, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                                "assets/catagory/sari.jpg"),
                                          ),
                                        );
                                      }))
                            ],
                          ),
 */