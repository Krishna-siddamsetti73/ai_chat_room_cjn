import 'package:ai_chat_room/data/remote/api_helper.dart';
import 'package:ai_chat_room/on_boarding/login_page.dart';
import 'package:ai_chat_room/on_boarding/sign_up_page.dart';
import 'package:ai_chat_room/screens/ai_chat_room_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
      //SignUpPage()
     // AiChatRoomPage()
      LoginPage(apiHelper: ApiHelper(),)
    );
  }
}
