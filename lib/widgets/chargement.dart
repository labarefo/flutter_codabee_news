
import 'package:flutter_codabee_news/widgets/texte_codabee.dart';
import 'package:flutter/cupertino.dart';

class Chargement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new TextCodabee("Chargement en cours...",
        fontStyle: FontStyle.italic,
        fontSize: 30.0,
      ),
    );
  }
  
}