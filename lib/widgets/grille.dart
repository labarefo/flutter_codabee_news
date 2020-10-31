

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codabee_news/models/date_convertisseur.dart';
import 'package:flutter_codabee_news/widgets/page_detail.dart';
import 'package:flutter_codabee_news/widgets/texte_codabee.dart';
import 'package:flutter_codabee_news/widgets/utils.dart';
import 'package:webfeed/webfeed.dart';

class Grille extends StatefulWidget {

  RssFeed feed;


  Grille(this.feed);

  @override
  _GrilleState  createState() {
    return new _GrilleState();
  }

}

class _GrilleState extends State<Grille> {
  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: widget.feed.items.length,
      itemBuilder: (context, i) {
        RssItem item = widget.feed.items[i];
        return InkWell(
          onTap: () {
            Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
              return new PageDetail(item);
            }));
          },
          child: new Card(
            elevation: 10.0,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    new TextCodabee( item.author ?? item.source?.value ?? "", fontSize: 10.0,),
                    new TextCodabee(new DateConvertisseur().convertirDate(item.pubDate), color: Colors.red,)
                  ],
                ),
                new TextCodabee(item.title),
                imageSiDisponible(item.enclosure.url, (MediaQuery.of(context).size.width / 2.5)),
              ],
            ),
          ),
        )
          ;
      },
    );
  }

}