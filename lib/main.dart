import 'package:ai_chat_room/app_repository/app_repository.dart';
import 'package:ai_chat_room/bloc/login_bloc/login_bloc.dart';
import 'package:ai_chat_room/data/remote/api_helper.dart';
import 'package:ai_chat_room/on_boarding/login_page.dart';
import 'package:ai_chat_room/on_boarding/sign_up_page.dart';
import 'package:ai_chat_room/screens/ai_chat_room_page.dart';
import 'package:ai_chat_room/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(create: (context) => LoginBloc(appRepository: AppRepository(apiHelper: ApiHelper())), child: MyApp()));
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
        HomePage()
        // AiChatRoomPage()
        //LoginPage(appRepository : AppRepository(apiHelper:ApiHelper()),)
    );
  }
}
