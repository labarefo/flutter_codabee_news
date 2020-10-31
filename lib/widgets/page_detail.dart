

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codabee_news/models/date_convertisseur.dart';
import 'package:flutter_codabee_news/widgets/texte_codabee.dart';
import 'package:flutter_codabee_news/widgets/utils.dart';
import 'package:webfeed/domain/rss_item.dart';

class PageDetail extends StatelessWidget {
  RssItem item;


  PageDetail(this.item);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Détail de l'article"),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            padding(top: 20.0),
            new TextCodabee(item.title, fontSize: 25.0, fontStyle: FontStyle.italic,),
            padding(top: 20.0),
            imageSiDisponible(item.enclosure.url, (MediaQuery.of(context).size.width / 1.5)),
            padding(top: 20.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new TextCodabee( item.author ?? item.source?.value ?? "", fontSize: 10.0,),
                new TextCodabee(new DateConvertisseur().convertirDate(item.pubDate), color: Colors.red,)
              ],
            ),
            padding(top: 20.0),
            new TextCodabee(item.description),
            padding(top: 20.0)
          ],
        ),
      ),
    );
  }

}