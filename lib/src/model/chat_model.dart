import 'package:flutter/material.dart';

class ChatModel extends ChangeNotifier{
   List<String> chatList= List<String>();

   void add(String newChat)
   {
      chatList.add(newChat);
      notifyListeners();
   }


}