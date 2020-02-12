import 'package:flutter/material.dart';
import './ui/portfolio_card.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Works extends StatefulWidget {
  Works({Key key}) : super(key: key);

  @override
  _WorksState createState() => _WorksState();
}

class _WorksState extends State<Works> {
  var _portfolioCards = List<PortfolioCard>();

  @override
  void initState() {
    generateCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(top: 15, bottom: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text("All"),
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("Mobile"),
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("IoT"),
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("Web"),
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),                                    
                ],
              ),
            ),

            ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                _portfolioCards[0],
                _portfolioCards[0],
                _portfolioCards[0],
                _portfolioCards[0],
              //Text("hoge")
              ],
            ),
          ]
        ),
          )
      );
  }

  void generateCards() {
    //ポートフォリオのデータを生成
    _portfolioCards.add(
      PortfolioCard(
          "ボイロとおバイク！",
          "Unity",
          10000,
          Fontisto.unity,
          "comment",
          "assets/images/icon.png",
          "desc",
          "imgPath/descpath",
          "C#",
          "Android/iOS",
          "google store link",
          "app store link"),
    );
  }
}

