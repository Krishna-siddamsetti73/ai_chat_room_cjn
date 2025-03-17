import 'package:ai_chat_room/screens/home_page.dart';
import 'package:ai_chat_room/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*0.9,
            width: MediaQuery.of(context).size.width*0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome to AI Interview / Vidum Room",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                sizedBoxHeight(),
                textField(icon: Icon(Icons.person),label: "Candidate ID", hintText: "Enter your Candidate ID", controller: nameController),
                sizedBoxHeight(),
                textField(icon: Icon(Icons.mail),label: "Name", hintText: "Enter your Name", controller: nameController),
                sizedBoxHeight(),
                textField(icon: Icon(Icons.phone),label: "Age", hintText: "Enter your Age", controller: nameController),
                sizedBoxHeight(),
                textField(icon: Icon(Icons.mail),label: "College Name", hintText: "Enter your College Name", controller: nameController),
                sizedBoxHeight(),
                DropdownMenu(
                    dropdownMenuEntries:[
                      DropdownMenuEntry(
                        label: "Male",
                        leadingIcon: Icon(Icons.male),
                        value: null,
                      ),
                      DropdownMenuEntry(
                        label: "Female",
                        leadingIcon: Icon(Icons.female),
                        value: null,
                      ),
                    ]
                ),
                sizedBoxHeight(),
                DropdownMenu(dropdownMenuEntries:[
                  DropdownMenuEntry(value: null, label: "College"),
                  DropdownMenuEntry(value: null, label: "School"),
                  DropdownMenuEntry(value: null, label: "Office"),
                  DropdownMenuEntry(value: null, label: "Organisation"),
                ]),
                sizedBoxHeight(),
                DropdownMenu(dropdownMenuEntries:[
                  DropdownMenuEntry(value: null, label: "Videum"),
                  DropdownMenuEntry(value: null, label: "Job Description"),
                  DropdownMenuEntry(value: null, label: "Ai Interview"),
              ],),
                sizedBoxHeight(),
                DropdownMenu(dropdownMenuEntries:[
                  DropdownMenuEntry(value: null, label: "Select this if Videum"),
                  DropdownMenuEntry(value: null, label: "AIML"),
                  DropdownMenuEntry(value: null, label: "Java Developer"),
                  DropdownMenuEntry(value: null, label: "Data Sciene"),
            ],),
                sizedBoxHeight(
                  mHeight: 22
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }, child: Text("Continue",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),)
            ]
          ),
        ),
      ),
      )
    );
  }
}
