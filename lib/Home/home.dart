import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wpmustafa/details/details.dart';
import 'package:wpmustafa/games/quizGame.dart';
import 'package:wpmustafa/test.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  final Widget child;

  Home({Key key, this.child}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  wp.WordPress wordpress = wp.WordPress(
      baseUrl: 'http://mustafa.alminawi.org/'
  );

  fetchPosts() {
    Future <List<wp.Post>> posts = wordpress.fetchPosts(
      postParams: wp.ParamsPostList(
        context: wp.WordPressContext.view,
        pageNum: 1,
        perPage: 100,

      ),
      fetchAuthor: true,
      fetchFeaturedMedia: true,
      fetchComments: true,
    );
    return posts;
  }

//  fetchComment(){
//
//    Future<List<wp.Comment>> comments = wordpress.fetchComments(
//      params: wp.ParamsCommentList(
//        context: wp.WordPressContext.view,
//        pageNum: 1,
//        perPage: 30,
//        includePostIDs: [1],
//      ),
//    );
//  }

//  void createComment({@required int userId, @required int postId}) {
//    final comment = wordpress.createComment(
//      comment: new wp.Comment(
//        author: userId,
//        post: postId,
//        content: "First!",
//        parent: 0,
//      ),
//    );
//
//    comment.then((c) {
//      print('Comment successfully posted with ID: ${c.id}');
//    }).catchError((err) {
//      print('Failed to comment: $err');
//    });
//  }

  getPostImage(wp.Post post) {
    if (post.featuredMedia == null) {
      return SizedBox();
    }
    return Image.network(post.featuredMedia.sourceUrl);
  }

//  getcomment(wp.Post post) {
//    if (post.comments == null) {
//      return SizedBox();
//    }
//    return post.comments;
//  }

  lunchUrl(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw'cannot find anything';
    }
  }
  bool descTextShowFlag = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.teal[300],
//
//          title: Text("Mustafa's App"),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(
//                Icons.settings,
//                color: Colors.white,
//              ),
//              onPressed: () {
//                Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizPage(),),)  ;
//                },
//            )
//          ],
//        ),
        backgroundColor: Colors.green[100],
        body: DefaultTextStyle.merge(
          style: const TextStyle(
            fontSize: 16.0,
            //fontFamily: 'monospace',
          ),
          child: Container(
            child: FutureBuilder(
              future: fetchPosts(),
              builder: (BuildContext, AsyncSnapshot<List<wp.Post>> snapshot){
                if(snapshot.connectionState == ConnectionState.none){
                  return Container();
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (context, index){
                  wp.Post post = snapshot.data[index];
                  return InkWell(
                    enableFeedback: false,
                    onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(post),),)  ;                },
                    child:       Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 2),
                              child: Card(
                                color: Colors.white,
                                elevation: 20.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                                        child: Container(
                                          width: 240.0,
                                          height: 310.0,

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        post.title.rendered,
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Html(
                                                        data: post.excerpt.rendered,
                                                        shrinkToFit: true,
                                                        onLinkTap: (String url){
                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(post),),)  ;
                                                          //lunchUrl(url);
                                                        },
                                                      ),
//                                                      Text(post.excerpt.rendered.toString(),
//                                                          maxLines: 5,textAlign: TextAlign.start),
//                                                      InkWell(
//                                                        onTap: (){  {
//                                                          descTextShowFlag = !descTextShowFlag;
//                                                        } },
//                                                        child: Row(
//                                                          mainAxisAlignment: MainAxisAlignment.end,
//                                                          children: <Widget>[
//                                                          Text("Show Less",style: TextStyle(color: Colors.blue),)
//                                                          ],
//                                                        ),
//                                                      ),





                                                      SizedBox(
                                                        height: 25.0,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          ClipOval(
                                                            child:Image.asset('assets/mustafa.jpg', fit: BoxFit.cover,
                                                              width: 50.0,
                                                              height: 50.0,),

                                                          ),
                                                          SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              Text(
                                                                post.author.name,
                                                                textAlign: TextAlign.left,
                                                                style: TextStyle(
                                                                  fontSize: 20.0,
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                post.date.replaceAll('T', '    '),
                                                                textAlign: TextAlign.left,
                                                                style: TextStyle(
                                                                  fontSize: 14.0,
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              width: 80.0,
                                              height: 120.0,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    child: getPostImage(post),
                                                  ),
//
//                                                  IconButton(
//                                                    icon: Icon(
//                                                      Icons.favorite,
//                                                      color: Colors.pinkAccent,
//                                                    ),
//
//                                                    onPressed: () {
//                                                      lunchUrl(post.link);
//
////                                                      Html(
//////                                                        data: post.excerpt.rendered,
//////                                                        shrinkToFit: true,
////                                                        onLinkTap: (String url){
////                                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(post),),)  ;
////                                                          lunchUrl(url);
////                                                        },
////                                                      );
//                                                    },
//                                                  ),
//
//                                                  InkWell(
//                                                      onTap: () {
//                                                        isFavorite = !isFavorite;
//                                                        setState(() {
//                                                        });
//                                                      },
//                                                      child: isFavorite ? Icon(
//                                                        Icons.favorite,
//                                                        color: Colors.red,
//                                                      ): Icon(Icons.favorite)),

                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },);


              },
            ),
          ),
        )
    );
  }
}

