import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:readmore/readmore.dart';

class Api_introduction extends StatefulWidget {
  const Api_introduction({super.key});

  @override
  State<Api_introduction> createState() => _Api_introductionState();
}

class _Api_introductionState extends State<Api_introduction> {
  String readmoretext =
      "An application programming interface is a way for two or more computer programs to communicate with each other. It is a type of software interface, offering a service to other pieces of software. A document or standard that describes how to build or use such a connection or interface is called an API specification.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "API Introduction",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
          )
        ],
      ),
    );
  }
}
