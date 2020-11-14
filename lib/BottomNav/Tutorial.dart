import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wpmustafa/Home/home.dart';

import 'UserBottomNavigator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 5;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 10),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 13.0 : 8.0,
      width: isActive ? 30.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.teal[200] : Colors.lightBlueAccent[100],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.08, 0.4, 0.7, 0.9],
                colors: [
                  Colors.teal,
                  Colors.tealAccent[100],

                  Colors.teal[200],
                  Colors.tealAccent[100],


                  // Color(0xFF4563DB),
                  // Color(0xFF5036D5),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
//                Container(
//                  alignment: Alignment.centerRight,
//                  child: FlatButton(
//                    onPressed: () => print('Skip'),
//                    child: Text(
//                      'Skip',
//                      style: TextStyle(
//                        color: Colors.black,
//                        fontSize: 20.0,
//                      ),
//                    ),
//                  ),
//                ),
                  Container(
                    height: 400.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top:10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/space.jpg',
                                  ),
                                  height: 255.0,
                                  width: 300.0,
                                ),
                              ),
                              //   SizedBox(height: 3.0),
                              Center(
                                child: Text(
                                  "Welcome to Mustafa's App!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    //  fontFamily: 'CM Sans Serif',
                                    fontSize: 20.0,
                                    height: 1.5,

                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'MUSTAFA MUSTAFA MUSTA FAhyfgb8gwbelfuhhnomsrjyegnfheukxfhmix3ejf,3,fxiur4h.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/patio.jpg',
                                  ),
                                  height: 250.0,
                                  width: 300.0,
                                ),
                              ),
                              // SizedBox(height: 30.0),
                              Text(
                                "Using Mustafa's App is easy...",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 20.0,
                                  height: 1.5,
                                ),                            ),
                              SizedBox(height: 15.0),
                              Text(
                                'Click on the Home icon to see my posts. Click on any post to see the full view.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/ghost.jpg',
                                  ),
                                  height: 250.0,
                                  width: 300.0,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "Test your self with Mustafa's quiz",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 20.0,
                                  height: 1.5,
                                ),                            ),
                              SizedBox(height: 10.0),
                              Text(
                                "Click on the book icon on the bottom of the page to take Mustafa's quiz!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/street.jpg',
                                  ),
                                  height: 250.0,
                                  width: 300.0,
                                ),
                              ),
                              // SizedBox(height: 30.0),
//                              Text(
//                                '',
//                                style: TextStyle(
//                                  color: Colors.white,
//                                  fontFamily: 'CM Sans Serif',
//                                  fontSize: 26.0,
//                                  height: 1.5,
//                                ),                            ),
                              SizedBox(height: 15.0),
                              Text(
                                "Want to comment on my posts? \nClick on the 'My Website icon on the bottom of the page.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/mustafa.jpg',
                                  ),
                                  height: 200.0,
                                  width: 300.0,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Text(
                                'Got all that?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CM Sans Serif',
                                  fontSize: 25.0,
                                  height: 1.5,
                                ),                            ),
                              SizedBox(height: 15.0),
                              Text(
                                "Read our policy (can be found in the drawer. And thank you for using Mustafa's App!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _currentPage != _numPages-1
                      ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      : Text(''),
                ],
              ),
            ),
          ),

      ),
      bottomSheet: _currentPage == _numPages -1
          ? Container(
        height: 60.0,
        width: double.infinity,
        color: Colors.teal[200],
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Home5(),),)  ;
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : Text(''),
    );
  }
}