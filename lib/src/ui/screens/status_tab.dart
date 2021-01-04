import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/res/app_assets.dart';
import 'package:whatsapp_clone/src/res/string_constants.dart';

class StatusTab extends StatefulWidget {
   @override
   _StatusTabState createState() => _StatusTabState();
 }

 class _StatusTabState extends State<StatusTab> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
          body:  Column(
               mainAxisSize: MainAxisSize.max,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 8,top: 8),
                   child: Row(
                     mainAxisSize: MainAxisSize.max,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       SizedBox(height: 55,width: 55,child: CircleAvatar(backgroundColor: Colors.white,backgroundImage: AssetImage(AppImages.zaar),)),
                       Container(
                         padding: EdgeInsets.only(left: 8),
                         child: Column(
                           mainAxisSize: MainAxisSize.max,
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(padding: EdgeInsets.only(bottom: 6),child: Text(StringConstants.myStatus,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),)),
                             Text(StringConstants.noUpdates,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Colors.black),),
                           ],
                         ),
                       )

                     ],
                   ),
                 ),
                 Divider(color: Colors.grey,)
               ],
            ),
      );
   }
 }
