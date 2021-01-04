import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/src/model/chat_model.dart';
import 'package:whatsapp_clone/src/res/app_assets.dart';
import 'package:whatsapp_clone/src/router/routergr.dart';
import 'package:whatsapp_clone/src/ui/commens/msg_design.dart';


class ChatScreen extends StatefulWidget {
   final obj;

  ChatScreen(this.obj);

  @override
  _ChatScreenState createState() => _ChatScreenState(this.obj);
}

class _ChatScreenState extends State<ChatScreen> {

  ChatModel model;
  TextEditingController chatController= TextEditingController();
  final ChatArguments obj;

  _ChatScreenState(this.obj);


  @override
  void initState() {
    super.initState();
    model= Provider.of<ChatModel>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          Expanded(
            child: InkWell(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Padding(padding: EdgeInsets.only(left: 6,right: 4),child: Icon(Icons.arrow_back,color: Colors.white,))
                  ),
                  CircleAvatar(backgroundImage: AssetImage(this.obj.img),backgroundColor: Colors.white,),
                  Expanded(flex: 1,child: Padding(padding: EdgeInsets.only(left: 6),child: Text(this.obj.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),))),
                  Padding(padding: EdgeInsets.only(right: 6),child: Icon(Icons.videocam,color: Colors.white,)),
                  Padding(padding: EdgeInsets.only(right: 6),child: Icon(Icons.call, color: Colors.white,)),
                  Icon(Icons.more_vert, color: Colors.white,)
                ],

              ),
              onTap: (){
                Navigator.pushNamed(context, MyRouter.personDetailScreen,arguments: this.obj);
              },
            ),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.backgroundImg, fit: BoxFit.cover,),
          Container(
            margin: EdgeInsets.only(top: 6),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Consumer<ChatModel>(
                      builder: (context,model,child) => ListView.builder(
                         scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: model.chatList != null ? model.chatList.length : 0,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomPaint(
                              painter: MsgDesign(),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 2,top: 2),
                                padding: EdgeInsets.only(left: 16,top: 6,bottom: 10),
                                child: Text(model.chatList[index],style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),)
                              ),
                            );
                          }
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 4,left: 4,right: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.white,
                          ),
                          child: TextField(
                            controller: chatController,
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "Type a message",
                                hintStyle: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500,fontSize: 13)
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          if(chatController.text.length > 0)
                          {
                            model.add(chatController.text);
                          }

                        },
                        child: CircleAvatar(
                          maxRadius: 20,
                          backgroundColor: Colors.teal,
                          child: Container(

                              child: Icon(
                                Icons.send,
                                color: Colors.white,)
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],

      ),
    );

  }



}








