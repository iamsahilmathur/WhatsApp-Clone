import 'package:flutter/cupertino.dart';

class FloatingBtnModel extends ChangeNotifier
{
    int index=1;

    void setIndex(int index){
       this.index= index;
       notifyListeners();
    }
}