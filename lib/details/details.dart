import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart'as wp;
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_html/flutter_html.dart';

class Details extends StatefulWidget {
  wp.Post post;
  Details(this.post);
  @override
  _DetailsState createState() => _DetailsState(this.post);
}


class _DetailsState extends State<Details> {
  wp.Post post;
  _DetailsState(this.post);

  getPostImage(){
  if(post.featuredMedia ==null){
    return SizedBox(
      height: 5.0,
    );
  }
  else{
    return Image.network(post.featuredMedia.sourceUrl);
  }
}
launchUrl(String link) async{
  if(await canLaunch(link)){
    await launch(link);
  }
  else{
    throw 'cant find anything from $link';
  }

}
  bool isFavorite = false;

  lunchUrl(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw'cannot find anything';
    }
  }

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title.rendered.toString(), style: TextStyle(color: Colors.black),),

        leading: new IconButton(icon: new Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop()



        ),
        elevation: 0.0,
//        title: Text(
//          post.title.rendered.toString(),
//         // textAlign: TextAlign.left,
//          style: TextStyle(
//            fontSize: 20.0,
//            color: Colors.black,
//            fontWeight: FontWeight.bold,
//          ),
//        ),
        //title: Image.asset('assets/mustafa.jpg'),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
      ),
      backgroundColor: Colors.green[100],
      body: Container(
        child: Padding(padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),

              Text(
                post.title.rendered.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),

              Text(
                "By: " + post.author.name.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "Date Published: " + post.date.replaceAll('T', '  '),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
              ),
              SizedBox(
                height: 40.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: getPostImage(),
              ),
              SizedBox(
                height: 20.0,
              ),
              Html(
                data: post.content.rendered,
              ),

              SizedBox(
                height: 25.0,
              ),


              Divider(
                color: Colors.black,
              ),

              Padding(
                padding: const EdgeInsets.only(right: 0.0),

                child: Row(
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          isFavorite = !isFavorite;
                          setState(() {
                          });
                          },
                        child: isFavorite ? Icon(Icons.favorite, size: 50.0,
                          color: Colors.red,
                        ) : Icon(Icons.favorite, color: Colors.grey, size: 50.0)),

                 new GestureDetector(
                        onTap: (){

                              lunchUrl(post.link);

                          },
                        child: new Container(
                          width: 300.0,
                          padding: new EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 16.0),
                          color: Colors.teal[300],
                          child: new Column(
                              children: [
                                new Text("Add comments&more"),
                              ]
                          ),
                        )
                    ),
                  ],

                ),
              ),

              SizedBox(
                height: 40.0,
              ),

            ],
          ),
        ),)
      ),

    );
  }

}