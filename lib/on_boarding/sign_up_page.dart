import 'package:ai_chat_room/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textField(icon: Icon(Icons.person),label: "Name", name: "Name", controller: nameController),
            sizedBoxHeight(),
            textField(icon: Icon(Icons.mail),label: "Email", name: "Email", controller: nameController),
            sizedBoxHeight(),
            textField(icon: Icon(Icons.phone),label: "Phone", name: "Phone", controller: nameController),
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
            )
          ],
        ),
      ),
    );
  }
}
