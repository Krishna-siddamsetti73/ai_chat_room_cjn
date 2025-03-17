import 'package:ai_chat_room/app_repository/app_repository.dart';
import 'package:ai_chat_room/bloc/login_bloc/login_bloc.dart';
import 'package:ai_chat_room/bloc/login_bloc/login_state.dart';
import 'package:ai_chat_room/data/remote/api_helper.dart';
import 'package:ai_chat_room/data/remote/urls.dart';
import 'package:ai_chat_room/on_boarding/sign_up_page.dart';
import 'package:ai_chat_room/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  AppRepository appRepository;
  LoginPage({required this.appRepository});

  TextEditingController idController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/back_ground.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Login Form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Lottie Animation
                  Lottie.asset("assets/animation/hello_ai_anima.json",
                      height: 400,width: 400),
                  // Input Field
                  TextField(
                    controller: idController,
                    decoration: InputDecoration(
                      hintText: 'Enter login details',
                     filled: false,
                     hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

//                   // Login Button
//                 BlocListener<LoginBloc, LoginUserState>(
//                   listener: (context, state) async {
//                     if (state is LoginSuccessState)  {
//                       String id = idController.text;
//                       appRepository.loginUser(bodyParams: {
//                         "candidate_id": id
//                       });
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
//                     }
//                     if(state is LoginErrorState){
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to login"),));
//                     }
//                   },
//                   child:
//                   OutlinedButton(onPressed: (){
//                   //apiHelper.getApi(url: AppUrls.BASE_URL_DEV);
//                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
//                 }, child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
// )
                  OutlinedButton(
  onPressed: () {
    String id = idController.text;
    if (id.isNotEmpty) {
      BlocProvider.of<LoginBloc>(context).add(LoginUser(mParams: {"candidate_id": id}));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter Candidate ID")),
      );
    }
  },
  child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
),

BlocListener<LoginBloc, LoginUserState>(
  listener: (context, state) {
    if (state is LoginSuccessState) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    if (state is LoginErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMsg)),
      );
    }
  },
  child: Container(), // Needed for BlocListener
),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
