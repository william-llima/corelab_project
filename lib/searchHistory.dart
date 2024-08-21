import 'package:flutter/cupertino.dart';

class SearchHistory extends ChangeNotifier{

  List<String>history=[];

  void adicionaHistory(String newhistory){
      if(!history.contains(newhistory) && newhistory != ''){
        history.add(newhistory);
      }

  }

}