import 'package:ai_chat_room/data/remote/api_helper.dart';
import 'package:ai_chat_room/data/remote/urls.dart';
import 'package:ai_chat_room/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  ApiHelper apiHelper;
  LoginPage({required this.apiHelper});

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

                  // Login Button
                OutlinedButton(onPressed: (){
                  apiHelper.getApi(url: AppUrls.BASE_URL_DEV);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }, child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
