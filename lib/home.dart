import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:styled_text/styled_text.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height / 5,
                ),
                Text(
                  "私がものを作るとき", 
                  style: GoogleFonts.sawarabiGothic(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      "誰かに使ってもらえるものを作る",
                      style: GoogleFonts.sawarabiGothic(),
                    ),
                  ),
                ),
                ListTile(title: Center(
                  child: Text(
                    "使って楽しいものを作る",
                    style: GoogleFonts.sawarabiGothic()
                  )
                  )
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      "誰でも使えるようにする",
                      style: GoogleFonts.sawarabiGothic(),
                    )
                  ),
                ),
                  SizedBox(
                  height: size.height / 20,
                ),
                  Icon(
                  Icons.arrow_downward,
                  size: 50.0
                  ),
                SizedBox(
                  height: 400,
                ),
                Padding(
                  padding: EdgeInsets.all(size.width / 35),
                  child: Container(
                      width: size.width / 6,
                      height: size.width / 6,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/icon.png'),
                          )
                      )),
                ),
                Text(
                      "たべ/tabe",
                      style: GoogleFonts.sawarabiGothic(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                SizedBox(
                      height: 10.0
                    ),
                Text(
                      "Flutter, Native iOSを中心に\nユーザが使って楽しいものを開発しています\n\n 技術は楽しそうと思えば何でも触っています\nLet's Swipe!",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                SizedBox(
                  height: 10.0,
                ),
                
                StyledText(
                  textAlign: TextAlign.center,
                  text: '<ios/> iOS / Flutter / Firebase / <unity/> Unity / Processing / <discord/> </twitter> Bot / <network/> IoT / <android/> Android / <react/> React / <html/> HTML & CSS',
                  styles: {
                    'ios': IconStyle(Fontisto.apple),
                    'unity': IconStyle(Fontisto.unity),
                    'discord': IconStyle(Fontisto.discord),
                    'twitter': IconStyle(Fontisto.twitter),
                    'network': IconStyle(Entypo.network),
                    'android': IconStyle(Fontisto.android),
                    'react': IconStyle(Fontisto.react),
                    'html': IconStyle(Fontisto.html5),
                    'css': IconStyle(Fontisto.css3),
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.githubSquare, 
                      size: 40,
                    ),
                    SizedBox(
                      width: size.width / 40,
                    ),
                    Icon(
                      FontAwesomeIcons.twitterSquare,
                      size: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width / 20,
                )
            ]
          )
        ));
  }
}
