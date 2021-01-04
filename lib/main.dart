import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/src/model/person_detail_model.dart';
import 'package:whatsapp_clone/src/router/routergr.dart';
import 'file:///G:/FlutterProjects/whatsapp_clone/lib/src/ui/screens/dashboard.dart';
import 'src/model/chat_model.dart';
import 'src/model/floatingbtn.dart';
import 'src/service_locator.dart';


void main() {
  setServiceLocator();
  WidgetsFlutterBinding.ensureInitialized(); // add when you are waiting for some initialization
  runApp(MyApp());
}


class MyApp extends StatelessWidget
{
   final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    @override
    Widget build(BuildContext context) {
          return FutureBuilder(
              future: _initialization,
              builder: (context,snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                  return MultiProvider(
                    providers: [
                      ChangeNotifierProvider<ChatModel>(create:(_) => ChatModel()),
                      ChangeNotifierProvider<PersonDetailModel>(create: (_) => PersonDetailModel()),
                      ChangeNotifierProvider<FloatingBtnModel>(create: (_)=> FloatingBtnModel())
                    ],
                    child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      onGenerateRoute: MyRouter.onGenerateRoute,
                      theme: ThemeData(
                          primarySwatch: Colors.teal,
                          accentColor: Colors.teal,
                          brightness: Brightness.light
                      ),
                      home: Dashboard(),
                    ),
                  );
                }

                return CircularProgressIndicator();
              });
      }
}


