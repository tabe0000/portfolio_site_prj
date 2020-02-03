import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 130,
              ),
              Text(
                "My Stances", 
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
                height: 80,
              ),

              Icon(
                Icons.keyboard_arrow_down,
                size: 100.0
                ),

            ]));
  }
}
