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
  var _selectedWorksTech = WorksTech.ALL;

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
                    child: const Text("All"),
                    color: _selectedWorksTech == WorksTech.ALL
                        ? Colors.grey.withOpacity(0.9)
                        : Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () => refleshPortfolioCards(WorksTech.ALL),
                  ),
                  RaisedButton(
                    child: const Text("Mobile"),
                    color: _selectedWorksTech == WorksTech.MOBILE
                        ? Colors.grey.withOpacity(0.9)
                        : Colors.white,
                    shape: StadiumBorder(
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () => refleshPortfolioCards(WorksTech.MOBILE),
                  ),
                  RaisedButton(
                    child: const Text("Web"),
                    color: _selectedWorksTech == WorksTech.WEB
                        ? Colors.grey.withOpacity(0.9)
                        : Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () => refleshPortfolioCards(WorksTech.WEB),
                  ),
                  RaisedButton(
                    child: const Text("IoT"),
                    color: _selectedWorksTech == WorksTech.IOT
                        ? Colors.grey.withOpacity(0.9)
                        : Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () => refleshPortfolioCards(WorksTech.IOT),
                  ),
                  RaisedButton(
                    child: const Text("Bot"),
                    color: _selectedWorksTech == WorksTech.BOT
                        ? Colors.grey.withOpacity(0.9)
                        : Colors.white,
                    shape: const StadiumBorder(
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () => refleshPortfolioCards(WorksTech.BOT),
                  ),
                  RaisedButton(
                    child: const Text("Visual Art"),
                    color: _selectedWorksTech == WorksTech.VISUAL_ART
                        ? Colors.grey.withOpacity(0.9)
                        : Colors.white,
                    shape: const StadiumBorder(
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () =>
                        refleshPortfolioCards(WorksTech.VISUAL_ART),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _selectedPortfolioCards.length,
              itemBuilder: (BuildContext context, int index) {
                return _selectedPortfolioCards[index];
              },
            ),
          ]),
        ));
  }

  //タブ切り替え時のリスト再生成
  void refleshPortfolioCards(WorksTech selectedTech) {
    _selectedWorksTech = selectedTech;
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
          "no github link",
          "no web link",
          "https://apps.apple.com/jp/app/%E3%83%9C%E3%82%A4%E3%83%AD%E3%81%A8%E3%81%8A%E3%83%90%E3%82%A4%E3%82%AF/id1436279821",
          "https://play.google.com/store/apps/details?id=com.tabe.MotorCycleWaifu&hl=ja",
          WorksTech.MOBILE),
    );
    _portfolioCards.add(
      PortfolioCard(
          "ニコ生コメントネギ振りシステム",
          "Node.js, Arduino",
          13000,
          Fontisto.nodejs,
          "コメントでネギ振りが出来る謎システム",
          "assets/app_images/negi.gif",
          "ニコニコ生放送のコメントを取得し、Arduino経由で接続されたはちゅねミクにネギを振らせる\n\n前々から、ニコニコ技術部ではちゅねにネギを振らせる文化に自分も参加したいと思っていた。そしてとある日の深夜1時、唐突にゾーンに入り作り上げた\n\nリアルタイムにインターネットを介してハード制御をすることの楽しさを知った\n\nIoTって楽しいのではと気がつき、ノリと勢いでESP32とセンサーを買い込んだので、FlutterとFirebaseを組み合わせたIoTデバイスを作っていく予定\n\n完全に余談だが、これの作ってみた動画がニコニコニュースで紹介されたり、運営にタグホームへ貼り付けられたりした結果1.3万再生を達成した",
          "imgPath/descpath",
          "JavaScript",
          "Windows/Mac/Linux",
          "https://github.com/tabe0000/niconama_tech_prj",
          "https://www.nicovideo.jp/watch/sm35859661",
          "no appStore link",
          "no googleplay link",
          WorksTech.IOT),
    );
    _portfolioCards.add(
      PortfolioCard(
          "CeVIOとおバイク for iOS",
          "iOS",
          150,
          Fontisto.apple,
          "ネイティブで初めて作ったアプリ",
          "assets/app_images/cobTitle.jpg",
          "初めてネイティブで作ったアプリ\nIAちゃんとおバイクすることが出来る。\n\nネイティブのアプリ制作に興味があったのと、Twitterでの深夜テンションにより開発された。\n\n基本的にはボイロとおバイクと機能は同じ。\n\nせっかくMacMiniがあるのでARKitを使ってなんか面白いことをしていきたい",
          "imgPath/descpath",
          "Swift",
          "iOS",
          "no github link",
          "no web link ",
          "https://apple.co/2Sllyam",
          "no playstore link",
          WorksTech.MOBILE),
    );
    _portfolioCards.add(PortfolioCard(
        "CeVIOとおバイク for Android",
        "Android",
        150,
        Fontisto.android,
        "ネイティブで作成。バックグラウンド動作が可能になった。",
        "assets/app_images/cboAndroidTitle.jpg",
        "Unity版ボイロとおバイクで要望が多かった、バックグランド動作機能の追加、そして新規機能としてナビを搭載するためにネイティブ開発された。\n\nFragmentの理解をせずにActivityだけでほとんどの画面を作成するという愚行をなしたので、次回ナビ実装時にリファクタリングをする予定でいる。\n\n次回はKotlin使いたいなぁ...",
        "imgPath/descpath",
        "Java",
        "Android",
        "no github link",
        "no web link",
        "no appstore link",
        "https://play.google.com/store/apps/details?id=jp.dip.tabe.ceviobikeapp",
        WorksTech.MOBILE));
    _portfolioCards.add(PortfolioCard(
        "Flutter ポートフォリオサイト",
        "Flutter",
        0,
        Entypo.network,
        "あなたが今触っているこのサイト、実はFlutterです！",
        "assets/app_images/flutter_portfolio.png",
        "前のサイトの保守性がたいへんよろしくないものだったので作り直した。\n\nFlutter for Webはまだまだバグもあり安定はしていないが、ある程度組むことはできた。\n\n簡単に要素を追加できるようになったので、なにか問題が起こらなければしばらくこれを使い続けると思う。\n\nFlutterでWebサイトを制作する案件とか降ってくる世の中になるといいですね。",
        "imgPath/descpath",
        "Dart",
        "Everything",
        "https://github.com/tabe0000/portfolio_site_prj",
        "https://tabedev.work",
        "no appstore link",
        "no playstore link",
        WorksTech.WEB));
    _portfolioCards.add(PortfolioCard(
        "照度監視システム、アプリ",
        "Flutter, Firebase, ESP32",
        0,
        Entypo.network,
        "Flutter, Firebase RealtimeDatabaseを使用して、照度監視アプリを作成。",
        "assets/app_images/monitor_brightness_app.png",
        "高専ディープラーニングコンテスト(DCON)に使用するためのアプリのモックアップとして制作をした。\n\nFirebase RealtimeDatabaseとFlutterの連携における文献がほとんど無く制作するのが大変だった。時間ができたらFlutterとFirebaseの連携に関する記事を書いていきたい。\n\nまた、ESP32というマイコンを使った。このマイコンは一つ1000円にも満たないにもかかわらず、WiFI, Bluetoothを使うことが出来ることに驚いた。\n\nIoT製品を作る楽しさを知ったので、また何か作りたいと思う。\n\n写真のbrightnessがlightnessに見える人は病気です。スペルミスなんかじゃありません。ええ決して。勘違いしてたとかじゃありません。",
        "imgpath/descpath",
        "Dart, C",
        "Android/iOS",
        "no github page",
        "https://twitter.com/tabe_unity/status/1210497318555766784?s=20",
        "no app sotre link",
        "no play store link",
        WorksTech.IOT));
    _portfolioCards.add(PortfolioCard(
        "SoundCircle",
        "Processing",
        0,
        Fontisto.java,
        "音に反応する円形ビジュアライザ\n弾いてみた、歌ってみたからVJ素材にも。",
        "assets/app_images/soundCircle.jpg",
        "円形のビジュアライザ。音を可視化する。歌ってみた、弾いてみたなどの動画の背景にも使えると思う。VJに興味があることからこれからも作っていく予定。p5.jsに移植するかもしれない。",
        "imagePath/descPath",
        "Java",
        "Windows/Mac/Linux",
        "https://github.com/tabe0000",
        "no web pagelink",
        "no app store link",
        "no play store link",
        WorksTech.VISUAL_ART));
    _portfolioCards.add(PortfolioCard(
        "某有名ブラクラの再現",
        "Processing",
        0,
        Fontisto.java,
        "インターネット老人会の方はわかりますよね。",
        "assets/app_images/alreadyIdiot.png",
        "懐かしいブラクラです。インターネット老人会の方はわかりますよね。\n\nProcessingの練習として画像を一切使用することなく、全てコーディングで作成しました。\n\n某事件が起こった直後に制作をしたため、一時期公開をしていなかったのですが、ほとぼりが冷めてきたので公開に切り替えました。音源はご自身でご用意ください。",
        "imgpPath/descpath",
        "Java",
        "Windows/Mac/Linux",
        "https://github.com/tabe0000/you-are-an-idiot-processing",
        "web pagelink",
        "no app store link",
        "no play store link",
        WorksTech.VISUAL_ART));
    _portfolioCards.add(PortfolioCard(
        "DiscordBot",
        "node.js",
        0,
        Fontisto.nodejs,
        "ゴリ押しでProcessingのコードを受け取り、画像を生成して返す。",
        "assets/app_images/result.jpg",
        "近々、Javascriptを触らないといけないっぽかったので、練習として作成した。\n\n今回は世界に挨拶するように天気API叩いても仕方ないので、Processingと連携させてみた。\n\n/proというコマンドとともに、ソースを投げると画像を生成して返してくれる。\n\n一応、他にもいろんな機能がある。(meme投げるとか、デプロイすると褒めてくれるとか、発狂するとか)\n\n実装方法をゴリ押しにしてしまい、セキュリティ的に大変よろしくないものとなったので身内サーバーで使う予定。\n\n割と楽しかったので、TwitterBotも作りたい。",
        "imagePath/descPath",
        "JavaScript",
        "Windows/Mac/Linux",
        "no github link",
        "no web pagelink",
        " no store",
        "no",
        WorksTech.BOT));
    _portfolioCards.add(PortfolioCard(
        "nuko bot.",
        "node.js",
        0,
        Fontisto.nodejs,
        "手軽な「ぬこ」の補給方法を確立しました。",
        "assets/app_images/nuko_bot.png",
        "友人がTwitterBotを動かしているのを見て羨ましくなりなんとなく初めた。\n\nどこかでねこの画像を見ると眠気ざましになるという話を聞き、APIを叩いてぬこの画像を取得して返すボットを作成した\n\n#give_me_nukoとツイートするとリプライをくれる。よく鯖落ちしているので必ず返ってくるとは限らない。\n\nherokuなどにデプロイしても良かったが、お部屋にCPU: Centrino, RAM: 2GBのつよつよパソコン()が余っていたので、それでサーバを運用をしている\n\n同時にサーバPCに入れたkona Linuxがものすごく軽く、パッケージの更新がubuntuよりも異様に早く驚いた。",
        "imagePath/descPath",
        "JavaScript",
        "Windows/Mac/Linux",
        "no github link",
        "no",
        "no",
        "no",
        WorksTech.BOT));
    _portfolioCards.add(PortfolioCard(
        "ぬこ補給所",
        "React, Next.js",
        0,
        Fontisto.react,
        "nuko.now.shが取れてしまった",
        "assets/app_images/next_nuko_serve.png",
        "Webフロントエンドフレームワークに触れたことがなかったというのと、HTML&CSSを素でガシガシ書くのはもう疲れたのでちょっとやってみた。\n\nこれを作った後にReactでポートフォリオサイトを作る予定だったが、諸事情によりFlutterになったためお蔵入り。\n\nただ、ReactNativeも触れるような気がするので、慣れてきてWebサイトをまた作るときになったら、またお世話になるかもしれない。\n\nこれ、ZEITにデプロイして驚いたのですが、nukoってプロジェクト誰も作ってなかったんですね。nuko.workも持っているのですが、これはこれで面白そうなので続けていきます。",
        "imgPath/descpath",
        "Javascript",
        "Everything",
        "no github link",
        "https://nuko.now.sh",
        "no",
        "no",
        WorksTech.WEB));
    _portfolioCards.add(PortfolioCard(
        "RealTimeVRTrip",
        "Unity",
        0,
        Fontisto.unity,
        "VRとリアルタイムな映像で旅行を可能にした。",
        "assets/app_images/robotgif.gif",
        "３年生になったばかりの頃、友人を巻き込んで立ち上げたプロジェクト\n\n自宅でVR機材を使うだけで遠隔旅行が可能になる\n\nロボット本体は完成している. 遠隔動作テストをしてみたところ動作した\n\nロボット遠隔制御通信にはオンラインゲームエンジンのphotonを用いた\n\nもしかしたら、ロボットを中継機としてドローンを遠隔操作するものへと変わるかもしれない\n\nあとは映像転送方法をどうするか検討中",
        "imagepath/descPath",
        "C#",
        "Windows",
        "no github link",
        "no web pagelink",
        "no",
        "no",
        WorksTech.IOT));
    _portfolioCards.add(PortfolioCard(
        "タイマー付きTodoリスト",
        "Flutter",
        0,
        Entypo.network,
        "Inherited Widgetを使ったデータの取り回しの学習と、定期テストに向けてタイマー付きTodoリストが欲しかったので作った。",
        "assets/app_images/timer_todo_list.png",
        "Inherited Widgetを使ったデータの取り回しの学習と、定期テストに向けてタイマー付きTodoリストが欲しかったので作った\n\nFlutterにおけるデザインパターンの代表例であるBLoCを学ぶ前に、とりあえず基礎から学ぼうと思いInherited Widgetを取り入れた。結果としてあまりメリットがないような組み方となってしまったが、過程のなかでは理解をしながら制作を進めたので理解自体は深まった\n\n今後はもう少し InheritedWidgetを使ったものを作っていき、煩わしさを感じてきたらProvider, その他デザインパターンに取り組みたい\n\nこのTodoリストは取り組んでいるものを可視化、タイマーを設置して効率化を図ったが自分に対しては拘束力を発揮せず、無意味なものだった。しかし友人が効果があるとして使ってくれたので良かった。\n\n Netlifyに初めてデプロイしたが、単純明快でやりやすかった。これから、ちょっとしたものを公開する時はNetlifyを使っていくと思う。",
        "imagepath/descPath",
        "Dart",
        "Everything",
        "https://github.com/tabe0000/timer_todo_list",
        "https://upbeat-bhabha-6ac256.netlify.com/#/",
        "no",
        "no",
        WorksTech.WEB));
    _portfolioCards.add(PortfolioCard(
      "VOICEROID & CeVIOにゃーんあぷり",
      "Flutter",
      10,
      Entypo.mobile,
      "にゃーん。",
      "assets/app_images/nyan_1.jpg",
      "インターン先のホテルで、ノリと勢いだけで作られたアプリ。\n作業中、Flutterは神だったと感じた気がする。\n\nこのアプリを使うと、ボイロとCeVIOが「にゃーんと」言ってくれる。\nデバッグ時の精神状態が半端なく良かった。\nkirinya.mp3とかクソかわええみたいな感じになっていた。\n\n初めてQiita記事を書くきっけかとなったものでもある。（ローカル音声再生系)",
      "imagePath/descPath",
      "Dart",
      "Android",
      "no github page",
      "https://play.google.com/store/apps/details?id=work.tabedev.nyanapp.nyan",
      "no",
      "no",
      WorksTech.MOBILE,
    ));
    _portfolioCards.add(PortfolioCard(
        "Flutter Todo List for Web",
        "Flutter",
        0,
        Entypo.network,
        "Flutterで初めて作られた作られたTodoアプリ。Webで動く。",
        "assets/app_images/flutter_todo_list.png",
        "WebでFlutterが動くということで、UI,　ロジックの練習を兼ねて作ってみた。\n\n結構いきあたりばったりな開発であったため、コードが大変宜しくない組み方になっている。\n\n\nFlutter for Webは安定していないため色々と不具合があり大変だったが、なんだかんだで楽しかった。\n\nWebでも動くため、学校でも積極的に使っていきたい。",
        "imagepath/descPath",
        "Dart",
        "Everything",
        "https://github.com/tabe0000/flutter_todo_list_for_web",
        "https://tabe0000.github.io/flutter_todo_list_for_web/#/",
        "no",
        "no",
        WorksTech.WEB));
    _portfolioCards.add(PortfolioCard(
        "旧ポートフォリオサイト",
        "HTML&CSS",
        0,
        Fontisto.html5,
        "以前、運用していたサイト。HTML&CSSで制作をしていた。",
        "assets/app_images/htmlcss.png",
        "前のサイトがmarkdownで書かれたサイトでなんともまぁ味気ないというか、寂しさがすごかったので作ったみた\n\nいろいろな企業を調べていると、割と何をやるにせよ身につけておいて損はないと感じたのでこれからも続けていく",
        "imagepath/descPath",
        "HTML&CSS",
        "Everything",
        "no github link",
        "no webpagelink",
        "no",
        "no",
        WorksTech.WEB));

    _selectedPortfolioCards = _portfolioCards;
  }
}
