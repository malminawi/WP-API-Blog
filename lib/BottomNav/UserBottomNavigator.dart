
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wpmustafa/BottomNav/Tutorial.dart';
import 'package:wpmustafa/BottomNav/mainScreen.dart';
import 'package:wpmustafa/Home/home.dart';
import 'package:wpmustafa/details/details.dart';
import 'package:wpmustafa/games/quizGame.dart';

class Home5 extends StatefulWidget {
  @override
  _Home5State createState() => _Home5State();
}
class _Home5State extends State<Home5> {
  int currentTab = 0; // to keep track of active tab index

  final List<Widget> screens = [

    Home(), Home5(), mainScreen(), QuizPage(), OnboardingScreen(),

  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = Home(); //

  // Our first view in viewport
  Future<void> _launched;
  String _launchUrl = 'https://mustafa.alminawi.org';



  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text("Mustafa's App"),

      ),
      drawer: Drawer(
          child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('You are A User '),
                  accountEmail: Text('908-391-8588'),
                  currentAccountPicture: new GestureDetector(
                      onTap: (){
                        print("This is the current user");},
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage('images/view.jpg'),
                      )
                  ),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => mainScreen(), fullscreenDialog: true));
                  },
                  leading: Icon(Icons.chat_bubble_outline),
                  title: Text('All users profiles '),

                ),

                ListTile(

                  title: Text('HomePage'),
                  leading: Icon(Icons.add),


                  onTap: ( ) {
                    Navigator.push(context, MaterialPageRoute(
                        builder: ( context ) => Home5(),
                        fullscreenDialog: true));
                  },


                ),

              ]
          )
      ),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 20,
        child: Container(
          color: Colors.teal[400],
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    minWidth:40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Home();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.red : Colors.white,
                        ),
                        Text(
                          'HOME',
                          style: TextStyle(
                            color:  currentTab == 0 ? Colors.red : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            QuizPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.book,
                          color: currentTab == 1 ? Colors.red : Colors.white,
                        ),
                        Text(
                          'Short Quiz ',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.red : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      _launchInApp(_launchUrl);
//                      setState(() {
//                        currentScreen =
//                            QuizPage(); // if user taps on this dashboard tab will be active
//                        currentTab = 2;
//                      })
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.web,
                          color: currentTab == 2 ? Colors.red : Colors.white,
                        ),
                        Text(
                          'My Website',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.red : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            OnboardingScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: currentTab == 3 ? Colors.red : Colors.white,
                        ),
                        Text(
                          'Info',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.red : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}