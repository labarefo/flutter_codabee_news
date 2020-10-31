import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Parser {

  final url = "https://www.france24.com/fr/rss";

  Future chargerRSS() async {
    var client = http.Client();
    final response = await client.get(url);
    RssFeed feed;
    if(response.statusCode == 200){
      feed = RssFeed.parse(response.body);
      return feed;
    }else{
      print("erreur: ${response.statusCode}");
    }
  }
}