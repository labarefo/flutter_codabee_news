import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateConvertisseur {
  String convertirDate (DateTime time){
    if(time == null){
      return "Date inconnue";
    }
    String il = "Il y a ";
    Duration duration = DateTime.now().difference(time);
    int sec = duration.inSeconds;
    String pluriel;
    if(sec <= 59){
      pluriel = sec > 1 ? "s" : "";
      return "$il $sec seconde$pluriel";
    }
    int min = duration.inMinutes;
    if(min <= 59){
      pluriel = min > 1 ? "s" : "";
      return "$il $min minute$pluriel";
    }
    int hour = duration.inHours;
    if(hour <= 23){
      pluriel = hour > 1 ? "s" : "";
      return "$il $hour heure$pluriel";
    }
    int days = duration.inDays;
    pluriel = days > 1 ? "s" : "";
    return "$il $days jour$pluriel";
  }
}