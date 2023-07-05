import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Api_Introduce extends StatefulWidget {
  const Api_Introduce({super.key});

  @override
  State<Api_Introduce> createState() => _Api_IntroduceState();
}

class _Api_IntroduceState extends State<Api_Introduce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Image.asset("assets/images/AA.png"),
          Text("API =  Application Programming Interface"),
          Text(
              "API এর অর্থ হল অ্যাপ্লিকেশন প্রোগ্রামিং ইন্টারফেস। এটি সফ্টওয়্যার অ্যাপ্লিকেশন তৈরির জন্য প্রোটোকল । APIগুলি বিভিন্ন সফ্টওয়্যার অ্যাপ্লিকেশনগুলিকে একে অপরের সাথে যোগাযোগ করতে, ডেটা বিনিময় করতে এবং একে অপরের বৈশিষ্ট্য এবং কার্যকারিতার সাথে যোগাযোগ করতে দেয় , "),
          Text(
              "APIগুলি সফ্টওয়্যার প্রোগ্রামগুলির মধ্যে মধ্যস্থতাকারী হিসাবে কাজ করে যা তাদের একটি মানসম্মত, সামঞ্জস্যপূর্ণ উপায়ে তথ্য আদান-প্রদান করতে দেয়।,"),
          Text(
            "এপিআইগুলি ওয়েব এবং মোবাইল অ্যাপ্লিকেশন ডেভেলপমেন্টে ব্যাপকভাবে ব্যবহৃত হয় ",
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
        ]),
      ),
    );
  }
}
