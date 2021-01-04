import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/src/model/floatingbtn.dart';
import 'package:whatsapp_clone/src/res/app_colors.dart';
import 'package:whatsapp_clone/src/res/string_constants.dart';
import 'package:whatsapp_clone/src/ui/screens/calls_tab.dart';
import 'package:whatsapp_clone/src/ui/screens/camera_tab.dart';
import 'package:whatsapp_clone/src/ui/screens/chat_tab.dart';
import 'package:whatsapp_clone/src/ui/screens/status_tab.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin{

  TabController _tabController;
  FloatingBtnModel model;
  final GlobalKey _menuKey = new GlobalKey();


  @override
  void initState() {
    super.initState();
     model= Provider.of<FloatingBtnModel>(context,listen: false);
    _tabController = new TabController(vsync: this, length: 4 ,initialIndex: 1);
    _tabController.addListener(() {
       if(_tabController.index > 0) {
          model.setIndex(_tabController.index);
         }

    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(flex: 1,child: Padding(padding: EdgeInsets.only(left: 12),child: Text(StringConstants.dashboardTitle, style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),))),
                Padding(padding: EdgeInsets.only(right: 8),child: Icon(Icons.search, color: Colors.white,)),
                Container(
                  width: 60,
                  child: PopupMenuButton(
                    key: _menuKey,
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(
                          child: const Text('New group'), value: 'New group'),
                      new PopupMenuItem<String>(
                          child: const Text('New broadcast'), value: 'New broadcast'),
                      new PopupMenuItem<String>(
                          child: const Text('WhatsApp Web'), value: 'WhatsApp Web'),
                      new PopupMenuItem<String>(
                          child: const Text('Starred messages'), value: 'Starred messages'),
                      new PopupMenuItem<String>(
                          child: const Text('Settings'), value: 'Settings'),
                    ],
                    onSelected: (_) {}
                    ),
                )
                ]
            ),
          )
        ],
        bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt,color: Colors.white,),),
              Tab(text: StringConstants.chats,),
              Tab(text: StringConstants.status,),
              Tab(text: StringConstants.calls,)
            ]
        ),
      ),
      floatingActionButton: Consumer<FloatingBtnModel>(
         builder: (context,model,child) => Builder(
             builder: (BuildContext context) {
               Widget _widget;
               switch(model.index)
               {
                 case 1:
                   _widget= FloatingActionButton(
                     backgroundColor: Colors.teal,
                     child: Icon(Icons.chat_rounded,color: Colors.white,),
                     onPressed: (){
                       final snackBar= SnackBar(content: Text('Looking for new chat!!!!!'));
                       Scaffold.of(context).showSnackBar(snackBar);
                     },
                   );
                   break;

                 case 2:
                   _widget= Column(
                     mainAxisSize: MainAxisSize.max,
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Container(
                         height: 48,
                         padding: EdgeInsets.all(4),
                         child: FloatingActionButton(
                           backgroundColor: AppColors.grey,
                           child: Icon(Icons.edit,color: Colors.black,),
                           onPressed: (){
                             final snackBar= SnackBar(content: Text('Want to comment!!!!!'));
                             Scaffold.of(context).showSnackBar(snackBar);
                           },
                         ),
                       ),
                       Container(
                         padding: EdgeInsets.all(4),
                         child: FloatingActionButton(
                           child: Icon(Icons.camera_alt,color: Colors.white,),
                           onPressed: (){
                             final snackBar= SnackBar(content: Text('Want to upload status!!!!!'));
                             Scaffold.of(context).showSnackBar(snackBar);
                           },
                         ),
                       )
                     ],
                   );
                   break;

                 case 3:
                   _widget= FloatingActionButton(
                       child: Icon(Icons.add_ic_call,color: Colors.white,),
                       onPressed: null

                   );
                   break;

               }
               return _widget;
             }
         ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CameraTab(),
          ChatTab(),
          StatusTab(),
          CallsTab()
        ],

      ),
    );
  }


}

