import 'package:flutter/cupertino.dart';

class PersonDetailModel extends ChangeNotifier
{
    bool isChecked= false;

    void setValue(bool value)
    {
       isChecked= value;
       notifyListeners();
    }
}