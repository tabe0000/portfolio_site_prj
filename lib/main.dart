import 'package:flutter/material.dart';
import 'home.dart';
import 'about.dart';
import 'works.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(
      text: 'Home',
    ),
    Tab(
      text: "Works",
    ),
    Tab(
      text: "About me",
    ),
  ];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "tabe's portfolio site",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          bottom: TabBar(
//          isScrollable: true,
            tabs: tabs,
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            labelColor: Colors.black,
          ),
        ),
        //Todo
        body: TabBarView(
          controller: _tabController,
          children: [
            Home(),
            Works(),
            About()
          ]
        ));
  }

  Widget _createTab(Tab tab) {
    return Center(
      child: Text(
        "10 min Rest Time",
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
