import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/src/model/person_detail_model.dart';
import 'package:whatsapp_clone/src/res/app_colors.dart';
import 'package:whatsapp_clone/src/res/string_constants.dart';
import 'package:whatsapp_clone/src/router/routergr.dart';


class PersonDetailScreen extends StatefulWidget {
   final  obj;
  PersonDetailScreen(this.obj);

  @override
  _PersonDetailScreenState createState() => _PersonDetailScreenState(this.obj);
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
   final ChatArguments obj;
   final GlobalKey _menuKey = new GlobalKey();

  _PersonDetailScreenState(this.obj);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: AppColors.grey,
          body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
             return <Widget>[
               SliverAppBar(
                 expandedHeight: 380.0,
                 floating: false,
                 pinned: true,
                 flexibleSpace:  FlexibleSpaceBar(
                   title: Text(obj.name),
                   background: Image(image: AssetImage(obj.img),fit: BoxFit.cover,),
                 ),
                 actions: [
                   Container(
                     width: 60,
                     child: PopupMenuButton(
                         key: _menuKey,
                         itemBuilder: (_) => <PopupMenuItem<String>>[
                           new PopupMenuItem<String>(
                               child: const Text('Add to contacts'), value: 'Add to contacts'),
                           new PopupMenuItem<String>(
                               child: const Text('Verify security code'), value: 'Verify security code'),
                         ],
                         onSelected: (_) {}
                     ),
                   )
                 ],
               )
             ];
            },
            body: Container(
              margin: EdgeInsets.only(top: 8),
              child: Column(
                   mainAxisSize: MainAxisSize.max,
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                       Container(
                         color: Colors.white,
                         padding: EdgeInsets.only(top: 6,left:12),
                         child: Row(
                             mainAxisSize: MainAxisSize.max,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                                   Expanded(child: Text(StringConstants.muteNotification, style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),)),
                                   Consumer<PersonDetailModel>(
                                       builder: (context,model,child) => Switch(
                                           value: model.isChecked,
                                           onChanged: (value) {
                                            model.setValue(value);
                                            print(model.isChecked);
                                           }
                                       ),
                                   )
                             ],
                         ),
                       ),
                       Divider(height: .01,),
                       Container(
                         color: Colors.white,
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                     Text(StringConstants.customNotification, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),)
                                ],
                          )
                       ),
                       Divider(height: .01,),
                       Container(
                         color: Colors.white,
                         padding: EdgeInsets.all(12),
                         child: Row(
                           mainAxisSize: MainAxisSize.max,
                           mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text(StringConstants.mediaVisibility, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),)
                             ],
                       ),
                     ),
                       Divider(height: 10,),
                       Flexible(
                         fit: FlexFit.loose,
                         child: Container(
                           color: Colors.white,
                           padding: EdgeInsets.all(12),
                           child: Row(
                             mainAxisSize: MainAxisSize.max,
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Flexible(
                                 flex: 4,
                                 fit: FlexFit.loose,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.stretch,
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                     Text(StringConstants.encryption, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),),
                                     Flexible(fit: FlexFit.loose,child: Text(StringConstants.encryptionMsg, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 13),))
                                   ],
                                 ),
                               ),
                               Flexible(fit: FlexFit.tight,child: Icon(Icons.lock_outlined,color: Colors.teal,))
                             ],
                         ),
                     ),
                       ),
                   ],
              ),
            ),
          ),
      ),
    );
  }
}
