import 'package:WildPulse/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:WildPulse/api_controller/blog_controller.dart';
import 'package:WildPulse/api_controller/user_controller.dart';
import 'package:WildPulse/utils/theme_util.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../api_controller/app_provider.dart';
import '../../api_controller/repository.dart';
import '../../model/blog.dart';
import '../../splash_screen.dart';
import '../../utils/image_util.dart';
import 'blog_wrap.dart';
import 'home.dart';


class developerinfo  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(


          title: Text(textAlign:TextAlign.center,style: TextStyle(fontFamily: 'Roboto', fontSize: 18,fontWeight: FontWeight.bold),'Crafted with ❤️ by Team WildPulse'),
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


// Color mycolor1 = const Color(0x2221234);
// Color mycolor2 = const Color(0xFFEF5350);
// 0x22221234
// FFF57C00

class MyStatelessWidget extends StatelessWidget {
  final List<UserData> userDataList = [
    UserData(
      name: 'Naveen Bala',
      position: 'CEO - DYN Logistics & SlideShow Media',
      position1: 'Hindusthan Innovations',
      description: 'Indophile | Nation First',
      description1: 'Food | Nature | Travel | Wildlife',
      imagePath: 'assets/images/Naveen.png',
      caption: 'Entrepreneur & WildLife Enthusiast',
      socialMediaLinks: {
        'facebook': 'https://www.facebook.com/dieforindia',
       //  'twitter': 'https://www.twitter.com/user1',
        'instagram': 'https://www.instagram.com/naveen.bala_/',
        'youtube' : 'http://www.youtube.com/@Naveen_Bala'

    },
    ),
    UserData(
      name: 'Ratish Nair',
      position: 'A passionate wildlife photographer ',
      position1: 'and trusted photo mentor.',
      description: 'Nickon Creater',
      description1: 'Brand Influencer: Columbia Sports',
      imagePath: 'assets/images/Ratish.png',
      caption: 'WildLife Photographer & Mentor',
      socialMediaLinks: {
    'facebook': 'https://www.facebook.com/nratish',
    // 'twitter': 'https://www.twitter.com/user1',
        'instagram': 'https://www.instagram.com/ratishnairphotography/',
        'youtube' : 'https://www.youtube.com/@ratishnairphotography'
    },
    ),
    UserData(
        name: 'Sai Rahul',
        position: 'Dons multiple hats as a  passionate',
        position1: 'WildLife Photographer',
        description: 'Civil Engineer | Photography Trainer',
        description1: 'Travel Vlogger',
        imagePath: 'assets/images/Sai.png',
        caption: 'Wildlife Photographer & Trainer',
      socialMediaLinks: {
    'facebook': 'https://www.facebook.com/sai.rahul.7792',
    // 'twitter': 'https://www.twitter.com/user1',
        'instagram': 'https://www.instagram.com/view_finder_snap/',
        'youtube' : 'https://www.youtube.com/@view_finder_snap'
    },
    ),
    UserData(
      name: 'Sai Suchith Kurra',
      position: 'Bridging Frontend Elegance  ',
      position1: 'with Backend Power: Crafting ',
      description: 'Seamless Digital Experiences',
      description1: 'Flutter | AWS | Python | RedHat Linux',
      imagePath: 'assets/images/Suchith.png',
      caption: 'Full-Stack Developer',
      socialMediaLinks: {
        'linkedinIn': 'https://www.linkedin.com/in/suchithk/',
        // 'twitter': 'https://www.twitter.com/user1',
        'instagram': 'https://www.instagram.com/suchith.chowdary/',
        'whatsapp' : 'https://wa.me//+919440610498'
      },
    ),
    UserData(
      name: 'Likhitha Rayana',
      position: "Designing Tomorrow's ",
      position1: 'Interactions, Today',
      description: 'Innovative UI/UX designer',
      description1: 'Figma | RedHat Linux',
      imagePath: 'assets/images/Likhita.png',
      caption: 'UI/UX Designer',
      socialMediaLinks: {
        'linkedinIn': 'https://www.linkedin.com/in/likhitha-rayana-35199b25b/',
        // 'twitter': 'https://www.twitter.com/user1',
        'instagram': 'https://www.instagram.com/likhitha_r_25/',

      },
    ),
    UserData(
      name: 'Anish Ganapathi',
      position: 'Crafting Experiences,',
      position1: ' Igniting Connections',
      description: 'Passionate UI/UX designer ',
      description1: 'Figma | AWS | UX',
      imagePath: 'assets/images/Anish.png',
      caption: 'UI/UX Designer',
      socialMediaLinks: {
        'linkedinIn':'https://www.linkedin.com/in/anish-ganapathi-086049220/' ,
        // 'twitter': 'https://www.twitter.com/user1',
        'instagram': 'https://www.instagram.com/ani.__sh/',

      },
    ),
    UserData(
      name: 'Vignesh Sai T',
      position: 'Transforming Vision into ',
      position1: 'Interactive Reality',
      description: 'Innovative front-end developer',
      description1: 'Flutter | SQL ',
      imagePath: 'assets/images/Vignesh.png',
      caption: 'Front-End Developer',
      socialMediaLinks: {
        'linkedinIn': 'https://www.linkedin.com/in/vignesh-sai-tirumalasetty-79a852259/',
        // 'twitter': 'https://www.twitter.com/user1',
        'instagram': 'https://www.instagram.com/vigneshsai_17/',

      },
    ),
    UserData(
      name: 'Pranav Vardhan',
      position: "Architecting Tomorrow's Digital",
      position1: 'Foundations Today.Specialized in',
      description: 'crafting robust server-side solutions',
      description1: 'Python | Linux',
      imagePath: 'assets/images/Pranav.png',
      caption: 'Back-End Developer',
      socialMediaLinks: {
        'linkedinIn': 'https://www.linkedin.com/in/pranav-vardhan-779730259/',
        // 'twitter': 'https://www.twitter.com/user1',
        'instagram': 'https://www.instagram.com/pranavvardhan/',

      },
    ),
    // Add more UserData objects as needed
  ];

  @override
  Widget build(BuildContext context) {
Color mycolor1 = const Color(0x2221234);
Color mycolor2 = const Color(0xFFEF5350);

    return Center(
      child: SingleChildScrollView(

        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: userDataList.length,
          itemBuilder: (context, index) {
            UserData userData = userDataList[index];




            return Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              decoration: BoxDecoration(
                color: mycolor1,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        userData.imagePath,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      '${userData.caption}',
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                      userData.name,
                      // textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Raleway', fontSize: 25, fontWeight: FontWeight.bold, color: mycolor2),
                    ),
                        Text(
                      userData.position,
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 14),
                    ),
                        Text(
                      userData.position1,
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 14),
                    ),
                        Text(
                      userData.description,
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 14),
                    ),
                        Text(
                      userData.description1,
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 14),
                    ),
                        SizedBox(height: 10),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: userData.socialMediaLinks.entries.map((entry) {
                            String socialMedia = entry.key;
                            String link = entry.value;

                            return Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () async {

                                  String? link = userData.socialMediaLinks[socialMedia];
                                  if (link != null) {
                                    if (await canLaunch(link)) {
                                      await launch(link);
                                    } else {
                                      // Handle error, e.g., show an error message
                                      print('Could not launch $link');
                                    }
                                  }
                                },
                                child: Icon(
                                  getSocialMediaIcon(socialMedia),
                                  size: 30,
                                ),
                              ),
                            );

                          }).toList(),
                          ),
              ],
                ),
              ],
            ),
              ),
            );









          },
        ),
      ),
    );


  }
}

IconData getSocialMediaIcon(String socialMedia) {
  switch (socialMedia) {
    case 'facebook':
      return FontAwesomeIcons.facebook;
  //   case 'twitter':
      return FontAwesomeIcons.twitter;
    case 'instagram':
      return FontAwesomeIcons.instagram;
    case 'youtube':
      return FontAwesomeIcons.youtube;
    case 'linkedinIn' :
      return FontAwesomeIcons.linkedinIn;
    case 'whatsapp' :
      return FontAwesomeIcons.whatsapp ;
  // Add more cases for other social media icons if needed
    default:
      return FontAwesomeIcons.link;
  }
}

class UserData {
  final String name;
  final String position;
  final String position1;
  final String description;
  final String description1;
  final String imagePath;
  final String caption;
  final Map<String, String> socialMediaLinks;
   // final String description3;

  UserData({
    required this.name,
    required this.position,
    required this.position1,
    required this.description,
    required this.description1,
    required this.imagePath,
    required this.caption,
    required this.socialMediaLinks,

  });
}
