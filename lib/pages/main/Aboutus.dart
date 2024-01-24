import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:WildPulse/api_controller/blog_controller.dart';
import 'package:WildPulse/api_controller/user_controller.dart';
import 'package:WildPulse/utils/theme_util.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';
import '../../api_controller/app_provider.dart';
import '../../api_controller/repository.dart';
import '../../model/blog.dart';
import '../../splash_screen.dart';
import '../../utils/image_util.dart';
import 'blog_wrap.dart';
import 'home.dart';

import 'package:flutter/material.dart';


class Aboutus  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(style: TextStyle(fontFamily: 'Roboto', fontSize: 24,fontWeight: FontWeight.bold),''),
          titleSpacing: 30,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),

        ),

        body: MyStatelessWidget(),
      ),
      debugShowCheckedModeBanner: false,

    );

  }
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // margin: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        // crossAxisAlignment: CrossAxisAlignment.start,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.asset('assets/images/app_icon.png'),
            ),


            Text(style: TextStyle(fontSize: 20,fontFamily: 'Roboto',fontWeight: FontWeight.bold),'About Us'),

            // Text(style: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.bold),'About Us'),
            // SizedBox(height: 20),

            SizedBox(
                height: 150,
                width: 360,
                child: Text(style: TextStyle(fontSize: 15,fontFamily: 'Roboto'),"Welcome to WildPulse, your go-to destination for the latest and most captivating wildlife news and magazines. We are passionate about bringing the wonders of the natural world to your fingertips, connecting you with the beauty and diversity of our planet's incredible wildlife.")),

            Text(style: TextStyle(fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.bold),"Our Mission"),
            SizedBox(
                height: 150,
                width: 360,
                child:Text(style: TextStyle(fontSize: 15,fontFamily: 'Roboto'),"At WildPulse, our mission is to inspire, educate, and foster a deep appreciation for wildlife conservation. We believe in the power of knowledge to drive positive change, and our platform is designed to be a hub for enthusiasts, nature lovers, and conservation advocates alike.")),

            Text(style: TextStyle(fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.bold),"What Sets Us Apart"),
            SizedBox(
                height: 140,
                width: 360,
                child: Text(style: TextStyle(fontSize: 15,fontFamily: 'Roboto'),"Dive into a world of wildlife with our comprehensive coverage of the latest news, in-depth articles, and stunning photography.Immerse yourself in our curated wildlife magazines, where each issue takes you on a journey through the untamed corners of our planet.")),




            Text(style: TextStyle(fontSize: 15,fontFamily: 'Roboto',fontWeight: FontWeight.bold),"Thank you for being a part of our community."),

            Text(style: TextStyle(fontSize: 15,fontFamily: 'Roboto',fontWeight: FontWeight.bold),"WildPulse Team',"),
            SizedBox(height: 20),
            SizedBox(

                child: Text(style: TextStyle(fontSize: 15,fontFamily: 'Roboto',fontWeight: FontWeight.bold),"Contact Us")),
            SizedBox(


                child: Text(style: TextStyle(fontSize: 15,fontFamily: 'Roboto'),"SlideShow Media India Pvt Ltd")),

            SizedBox(
                height: 40,
                width: 360,
                child: Text(style: TextStyle(fontSize: 15,fontFamily: 'Roboto'),"Email: write@wildpulse.in")),




            // style: TextStyle(fontSize: 24),
          ],
        ),
      ),
    );




  }
}
