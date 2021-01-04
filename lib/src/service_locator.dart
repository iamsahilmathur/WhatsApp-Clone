
import 'package:get_it/get_it.dart';
import 'package:whatsapp_clone/src/model/chat_model.dart';

GetIt getIt= GetIt.instance;

void setServiceLocator()
{

   getIt.registerFactory(() => ChatModel());
}