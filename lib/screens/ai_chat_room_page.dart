import 'package:ai_chat_room/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AiChatRoomPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child:Image.asset("assets/images/interview_room_image.jpg",fit: BoxFit.cover,)
          ),
          Center(
              child: check(height: mHeight, width: mWidth)
          ),
        ],
      )
    );
  }
  Widget? check({required double height,required double width}){
    if(height>width){
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(200),
              )
          ),
          Stack(
            children: [
              Positioned(
                child:  Container(
                height: 100,
                width: 225,
                  //color: Colors.transparent,
                child: Stack(
                  children:[
                    Positioned.fill(child: Image.asset("assets/images/message_image.png",fit: BoxFit.fill,),),
                    Center(
                    child: Text("Hi, I am Interview Bot",style: TextStyle(fontSize: 14,color: Colors.white),),
                  ),
                  ]
                ),
              ),),
              sizedBoxHeight(mHeight: 22),
              Lottie.asset("assets/animation/interview_bot_ai_3.json",height: 350,width: 350)]
          ),
          //Lottie.asset("assets/animation/interview_bot_ai_3.json",height: 350,width: 350)
        ],
      );
    }else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(500),
              ),
          ),
          SizedBox(width: 21,),
          Stack(
              children: [
                Positioned(
                  child:  Container(
                    height: 150,
                    width: 255,
                    color: Colors.transparent,
                    child: Stack(
                        children:[
                          Positioned.fill(
                            child: Image.asset("assets/images/message_image.png",fit: BoxFit.fill,),),
                          Center(
                            child: Text("Hi, I am Interview Bot",style: TextStyle(fontSize: 14,color: Colors.white),),
                          ),
                        ]
                    ),
                  ),),
                sizedBoxHeight(mHeight: 22),
                Lottie.asset("assets/animation/interview_bot_ai_3.json",height: 350,width: 350)]
          ),
        ],
      );
    }
  }

}
