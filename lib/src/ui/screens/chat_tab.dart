import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/model/chat_data.dart';
import 'package:whatsapp_clone/src/res/app_assets.dart';
import 'package:whatsapp_clone/src/router/routergr.dart';

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {

  List<ChatData> chatList=  List<ChatData>();

    @override
    void initState() {
      setList();
      super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: ListView.builder(
           itemCount: chatList.length != null && chatList.length >= 0 != null ? chatList.length : 0,
           itemBuilder: (BuildContext context, int index){
             return InkWell(
               child: Column(
                 mainAxisSize: MainAxisSize.max,
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   Container(
                     padding: EdgeInsets.only(left: 8,top: 8),
                     child: Row(
                       mainAxisSize: MainAxisSize.max,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         SizedBox(height: 48,width: 48,child: CircleAvatar(backgroundImage: AssetImage(chatList[index].imgUrl,),)),
                         Container(
                           padding: EdgeInsets.only(left: 8),
                           child: Column(
                             mainAxisSize: MainAxisSize.max,
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(padding: EdgeInsets.only(bottom: 6),child: Text(chatList[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                               Text(chatList[index].recentChat,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                             ],
                           ),
                         )

                       ],
                     ),
                   ),
                   Divider(color: Colors.grey,)
                 ],
               ),
               onTap:() {
                 sendToNext(chatList,index);
               },
             );
           },
         )
    );
  }

  Future<void> sendToNext(List<ChatData> chatList,int index) async
  {
       await Navigator.pushNamed(context, MyRouter.chatScreen,arguments: ChatArguments(chatList[index].imgUrl, chatList[index].name));
  }

  void setList()
  {
    chatList.add(ChatData("Amyra","Hii",AppImages.amyra));
    chatList.add(ChatData("Chahath","Hii",AppImages.preksha));
    chatList.add(ChatData("Preksha","Hii",AppImages.preksha));
    chatList.add(ChatData("Sonal","Hii",AppImages.sonal));
    chatList.add(ChatData("Zaar","Hii",AppImages.zaar));

  }

}

