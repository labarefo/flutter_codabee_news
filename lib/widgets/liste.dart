

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codabee_news/models/date_convertisseur.dart';
import 'package:flutter_codabee_news/widgets/page_detail.dart';
import 'package:flutter_codabee_news/widgets/texte_codabee.dart';
import 'package:flutter_codabee_news/widgets/utils.dart';
import 'package:webfeed/webfeed.dart';

class Liste extends StatefulWidget {

  RssFeed feed;


  Liste(this.feed);

  @override
  _ListeState createState() {
    return new _ListeState();
  }
}

class _ListeState extends State<Liste> {
  @override
  Widget build(BuildContext context) {
    final taille = MediaQuery.of(context).size.width / 2.5;
    return new ListView.builder(
      itemCount: widget.feed.items.length,
      itemBuilder: (context, i) {
        RssItem item = widget.feed.items[i];
        return Container(
          child: new Card(
              elevation: 10.0,
              child: new InkWell(
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                    return new PageDetail(item);
                  }));
                },
                child: new Column(
                children: [
                  padding(),
                  new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new TextCodabee( item.author ?? item.source?.value ?? "", fontSize: 10.0,),
                      new TextCodabee(new DateConvertisseur().convertirDate(item.pubDate), color: Colors.red,)
                    ],
                  ),
                  padding(),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      imageSiDisponible(item.enclosure.url, taille),
                      new Container(
                        width: taille,
                        child: new TextCodabee(item.title),
                      )
                    ],
                  ),
                  padding()
                ],
              ),
          ),
          ),
          padding: EdgeInsets.only(left: 7.5, right: 7.5),
        );
      },
    );
  }


  
}