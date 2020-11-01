import 'package:flutter/material.dart';
import 'package:flutter_codabee_news/models/parser.dart';
import 'package:flutter_codabee_news/widgets/chargement.dart';
import 'package:flutter_codabee_news/widgets/grille.dart';
import 'package:flutter_codabee_news/widgets/liste.dart';
import 'package:webfeed/domain/rss_feed.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  RssFeed feed;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: (){
                setState(() {
                  feed = null;
                  parse();
                });

              })
        ],
      ),
      body: choixDuBody(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget choixDuBody(){
    if(feed == null){
      return new Chargement();
    }
    Orientation orientation = MediaQuery.of(context).orientation;
    if(orientation == Orientation.portrait){
      return new Liste(feed);
    }
    return new Grille(feed);
  }

  @override
  void initState() {
    parse();
  }

  Future<Null> parse() async {
    RssFeed recu = await Parser().chargerRSS();
    if(recu != null){
      setState(() {
        feed = recu;
      });
    }
  }
}
