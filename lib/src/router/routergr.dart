import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/ui/screens/chat_screen.dart';
import 'package:whatsapp_clone/src/ui/screens/person_detail_screen.dart';

class MyRouter{

   static const chatScreen= "/chatScreen";
   static const personDetailScreen= "/personDetailScreen";


  static final navigator = ExtendedNavigator();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

      switch(settings.name){

        case MyRouter.chatScreen :
          ChatArguments obj= args;
          return MaterialPageRoute<dynamic>(builder: (_) => ChatScreen(obj));
           break;

        case MyRouter.personDetailScreen:
          ChatArguments obj= args;
          return MaterialPageRoute<dynamic>(builder: (_) => PersonDetailScreen(obj));
          break;
      }

  }



}
class ChatArguments
{
   String img,name;

   ChatArguments(String img,String name)
   {
      this.img= img;
      this.name= name;
   }

}