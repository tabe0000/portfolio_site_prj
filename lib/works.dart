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
  var _selectedPortfolioCards = List<PortfolioCard>();

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
          child: Column(children: <Widget>[
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
                    onPressed: () => refleshPortfolioCards(WorksTech.ALL),
                  ),
                  RaisedButton(
                    child: Text("Mobile"),
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () => refleshPortfolioCards(WorksTech.MOBILE),
                  ),
                  RaisedButton(
                    child: Text("IoT"),
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () => refleshPortfolioCards(WorksTech.IOT),
                  ),
                  RaisedButton(
                    child: Text("Web"),
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () => refleshPortfolioCards(WorksTech.WEB),
                  ),
                ],
              ),
            ),
            ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: _selectedPortfolioCards),
          ]),
        ));
  }

  void refleshPortfolioCards(WorksTech selectedTech) {
    setState(() {
      _selectedPortfolioCards = [];
      if (selectedTech == WorksTech.ALL) {
        _selectedPortfolioCards = _portfolioCards;
      } else {
        _portfolioCards.forEach((card) {
          if (selectedTech == card.worksTech) {
            _selectedPortfolioCards.add(card);
          }
        });
      }
    });
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
          "app store link",
          WorksTech.MOBILE),
    );
    _portfolioCards.add(
      PortfolioCard(
          "ニコ生コメントネギ振りシステム",
          "Node.js,Arduino",
          13000,
          Fontisto.nodejs,
          "comment",
          "assets/images/icon.png",
          "desc",
          "imgPath/descpath",
          "Javascript",
          "Windows/Mac/Linux",
          "github link",
          "niconico link",
          WorksTech.IOT),
    );
    _portfolioCards.add(PortfolioCard(
        "ぬこ補給所",
        "React, Next.js",
        0,
        Fontisto.react,
        "commnet",
        "assets/images/icon.png",
        "desc",
        "imgPath/descpath",
        "Javascript",
        "Everything",
        "github link",
        "web pagelink",
        WorksTech.WEB));
    _selectedPortfolioCards = _portfolioCards;
  }
}
