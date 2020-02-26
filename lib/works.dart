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
    Size size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.symmetric(
            vertical: 8.0, horizontal: size.width < 800 ? 10 : size.width / 5),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 23),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10.0,
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
                    child: Text("Web"),
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () => refleshPortfolioCards(WorksTech.WEB),
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
                    child: Text("Bot"),
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () => refleshPortfolioCards(WorksTech.BOT),
                  ),
                  RaisedButton(
                    child: Text("Visual Art"),
                    color: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () =>
                        refleshPortfolioCards(WorksTech.VISUAL_ART),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _selectedPortfolioCards.length,
              itemBuilder: (BuildContext context, int index) {
                print(size.width);
                print(size.width / 2);
                return _selectedPortfolioCards[index];
              },
            ),
          ]),
        ));
  }

  //タブ切り替え時のリスト再生成
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
          "ボイスロイドと二人乗り出来る！",
          "assets/app_images/voiroto.png",
          "はじめて世に出したアプリ\n\n同人アプリは伸びて50DLがいいところと言われる中、1年足らずで9000DLを突破\n\nバイクのキーと連動させることができる。車モードも搭載されている\n\n3Dゲームエンジンで作成していることを利用して車と徒歩モードでは立体音響を利用することができる\n\nプログラミングの経験がごく浅いときに作成したので保守性が非常に悪い\n\nただ、それらを考慮しながら作らなくてはならないということを教えてくれたアプリでもある\n\n現在は、UIの大幅改善、新規ボイス追加、新規モード追加とARコンテンツの追加をするべく、一から作り直している",
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
          "コメントでネギ振りが出来る謎システム",
          "assets/app_images/negi.gif",
          "desc",
          "imgPath/descpath",
          "Javascript",
          "Windows/Mac/Linux",
          "github link",
          "niconico link",
          WorksTech.IOT),
    );
    _portfolioCards.add(
      PortfolioCard(
        "ぬこ補給所",
        "React, Next.js",
        0,
        Fontisto.react,
        "nuko.now.shが取れてしまった",
        "assets/app_images/next_nuko_serve.png",
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
