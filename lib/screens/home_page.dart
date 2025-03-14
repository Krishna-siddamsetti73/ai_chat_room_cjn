import 'package:ai_chat_room/screens/ai_chat_room_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';

import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController fourDigitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/back_ground.jpg",fit: BoxFit.cover,)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 21,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(onPressed: () async {
                       // getImage();
                         XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      }, child: Text("Upload from gallary",style: TextStyle(color: Colors.white,fontSize: 16),)),
                      SizedBox(width: 8,),
                      OutlinedButton(onPressed: (){}, child: Text("Record Video",style: TextStyle(color: Colors.white,fontSize: 16),)),
                    ]),
                SizedBox(height: 51,),
                Lottie.asset("assets/animation/home_page_ai_anime.json",height: 250,width: 250),
                SizedBox(height: 11,),
                InkWell(
                  onTap: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Enter 4 digit code"),
                        content: TextField(
                          controller: fourDigitController,
                        ),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Cancel")),
                          TextButton(onPressed: (){
                            if(fourDigitController.text.length == 4){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AiChatRoomPage()));
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter a valid code")));
                            }
                          }, child: const Text("Submit")),
                        ],
                      );
                    });
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height*0.1,
                      width: MediaQuery.of(context).size.width*0.5,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(21),
                        image: DecorationImage(
                          image: AssetImage("assets/images/back_ground.jpg",),fit: BoxFit.cover
                        )
                      ),
                      child: const Center(
                        child: Text("Enter AI chat room",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                      )
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
  Future getImage() async {
    List<Media>? res = await ImagesPicker.pick(
      count: 1,
      pickType: PickType.video,
    );
  }
}
