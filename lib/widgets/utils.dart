
import 'package:flutter/material.dart';

Padding padding({double top: 10.0}){
  return new Padding(padding: EdgeInsets.only(top: top),);
}

Widget imageSiDisponible(String url, taille) {
  if(url == null || url.isEmpty){
    return new Container();
  }
  return new Card(
    elevation: 7.5,
    child: new Container(
      width: taille,
      child: new Image.network(url, fit: BoxFit.fill,),
    ),
  );
}